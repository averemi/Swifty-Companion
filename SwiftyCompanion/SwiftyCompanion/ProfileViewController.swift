//
//  ProfileViewController.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 4/14/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let sections = ["Projects", "Skills"]
    var user: User? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
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
