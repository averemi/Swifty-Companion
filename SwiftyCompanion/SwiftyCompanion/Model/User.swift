//
//  User.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 6/30/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import SwiftyJSON

struct User {
    let displayName: String
    let login: String
    let imageUrl: String
    let wallet: String
    let email: String
    let level: String
    let city: String
    let correctionPoint: String
    let phone: String
    var projects: [[String: Int]]?
    var skills: [[String: Double]]?
  //  var JSON: JSON
}
