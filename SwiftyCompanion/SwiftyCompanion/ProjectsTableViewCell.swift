//
//  ProjectsTableViewCell.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 7/2/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class ProjectsTableViewCell: UITableViewCell {
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var projectLabel: UILabel!
    
    func configure(project: [String: Int]) {
        for (key, value) in project {
            projectLabel.text = "\(key)"
            markLabel.text = "\(value)"
            markLabel.textColor = (value >= 75 || (value >= 50 && key.lowercased().range(of:"piscine") != nil)) ? #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1) : #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        }
    }
}
