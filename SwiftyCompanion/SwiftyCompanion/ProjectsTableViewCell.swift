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
        }
    }
}
