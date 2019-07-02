//
//  UserTableViewCell.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 7/2/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    private var imageArray: [String] = ["default_avatar", "default_avatar_cat", "default_avatar_dog", "default_avatar_penguin", "default_avatar_panda"]

    func configure(user: User) {
        avatarImage.image = UIImage(named: imageArray[Int(arc4random_uniform(5))])
        nameLabel.text = user.displayName
        loginLabel.text = user.login
    }

}
