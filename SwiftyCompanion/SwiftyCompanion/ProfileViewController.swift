//
//  ProfileViewController.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 4/14/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit
import Kingfisher
import PKHUD

class ProfileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var correctionPointsLabel: UILabel!
    @IBOutlet weak var walletLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var displayNameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    let sections = ["Projects", "Skills"]
    var user: User? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        prepareUI()
    }

    func prepareUI() {
        guard let user = user else { return }

        HUD.show(.progress)
        levelLabel.text = user.level
        correctionPointsLabel.text = user.correctionPoint
        walletLabel.text = "\(user.wallet) ₳"
        locationLabel.text = user.city
        loginLabel.text = user.login
        displayNameLabel.text = user.displayName
        phoneLabel.text = user.phone
        emailLabel.text = user.email
        
        guard let url = URL(string: user.imageUrl) else { return }
        ImageDownloader.default.downloadImage(with: url, options: [], progressBlock: nil) { [weak self] (image, error, url, data) in
            guard let self = self else { return }

            self.photoImageView.image = image
            HUD.hide()
        }
        photoImageView.layer.cornerRadius = photoImageView.frame.height / 2
        
        navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.937254902, green: 0.937254902, blue: 0.9568627451, alpha: 1)
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
            case 0:
                return 35
            default:
                return 50
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return sections[0]
        case 1:
            return sections[1]
        default:
            return ""
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let user = user else { return 0 }

        switch section {
        case 0:
            guard let projects = user.projects else { return 0 }
            return projects.count
        case 1:
            guard let skills = user.skills else { return 0 }
            return skills.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "projectCell", for: indexPath) as! ProjectsTableViewCell
            guard let user = user, let projects = user.projects else { return cell }

            cell.configure(project: projects[indexPath.row])
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: "skillCell", for: indexPath) as! SkillsTableViewCell
            guard let user = user, let skills = user.skills else { return cell }
            
            cell.configure(skill: skills[indexPath.row])
            return cell
        }
    }
}
