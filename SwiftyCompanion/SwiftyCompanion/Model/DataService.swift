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
        let wallet = json["wallet"].stringValue
        let email = json["email"].stringValue
        let level = json["cursus_users"][0]["level"].stringValue
        let city = json["campus"][0]["city"].stringValue
        let correctionPoint = json["correction_point"].stringValue
        let phone = json["phone"].stringValue
        guard let projectsArray = json["projects_users"].array else {
            return User(displayName: displayName, login: login, imageUrl: imageURL, wallet: wallet, email: email, level: level, city: city, correctionPoint: correctionPoint, phone: phone, projects: nil, skills: nil)
        }
        var projects: [[String: Int]] = []
        for project in projectsArray {
            if project["status"].stringValue == "finished" && project["final_mark"] != JSON.null && (project["project"]["slug"].stringValue.lowercased().range(of:"piscine") == nil ||  project["project"]["name"].stringValue.lowercased().range(of:"piscine") != nil) && project["project"]["parent_id"] == JSON.null {
                projects.append([project["project"]["name"].stringValue: project["final_mark"].intValue])
            }
        }
        guard let skillsArray = json["cursus_users"][0]["skills"].array else {
            return User(displayName: displayName, login: login, imageUrl: imageURL, wallet: wallet, email: email, level: level, city: city, correctionPoint: correctionPoint, phone: phone, projects: projects, skills: nil)
        }
        var skills: [[String: Double]] = []
        for skill in skillsArray {
            skills.append([skill["name"].stringValue: skill["level"].doubleValue])
        }
        return User(displayName: displayName, login: login, imageUrl: imageURL, wallet: wallet, email: email, level: level, city: city, correctionPoint: correctionPoint, phone: phone, projects: projects, skills: skills)
    }
}
