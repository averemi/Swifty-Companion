//
//  SkillsTableViewCell.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 7/2/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class SkillsTableViewCell: UITableViewCell {
    @IBOutlet weak var skillLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var percentageLabel: UILabel!
    
    func configure(skill: [String: Double]) {
        for (key, value) in skill {
            skillLabel.text = "\(key)"
            levelLabel.text = (String(format: "%.2f", value))
            progressView.progress = Float(value / 20)
            percentageLabel.text = (String(format: "%.2f", 100 * value / 20)) + "%"
        }
    }
}
