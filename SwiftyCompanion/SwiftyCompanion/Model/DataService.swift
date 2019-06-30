//
//  DataService.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 6/30/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import SwiftyJSON

class DataService {
    func parseUser(from json: JSON) -> User {
        let displayName = json["displayname"].stringValue
        let login = json["login"].stringValue
        let imageURL = json["image_url"].stringValue
        let user = User(displayName: displayName, login: login, imageUrl: imageURL)
        return user
    }
}
