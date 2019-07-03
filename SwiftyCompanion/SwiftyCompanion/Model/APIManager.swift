//
//  APIManager.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 4/14/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class APIManager {
    var token = ""
    
    func getAccessToken(success: ((Bool)->Void)? = {_ in return }, failure: ((String)->Void)? = {_ in return }) {
        let url = URLs.getToken
        let params = [ "grant_type" : "client_credentials",
            "client_id": Constants.uid,
            "client_secret": Constants.clientSecret]
        
        Alamofire.request(url, method: .post, parameters: params).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.token = json["access_token"].stringValue
                    print("token \(self.token)")
                    self.checkAccessToken()
                }
            case .failure(let error):
                print(error)
                failure?(error.localizedDescription)
            }
        }
    }
    
    func checkAccessToken(failure: ((String)->Void)? = {_ in return }) {
        let url = URLs.checkToken
        let headers = [ "Authorization": "Bearer \(token)"]

        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let expirationTime = json["expires_in_seconds"].stringValue
                    print("The token expires in \(expirationTime)")
                    if Int(expirationTime) ?? 1 <= 0 {
                        self.getAccessToken()
                    }
                }
            case .failure(let error):
                print(error)
                failure?(error.localizedDescription)
            }
        }
    }
    
    func searchUser(user: String, success: ((JSON)->Void)?, failure: (()->Void)?) {
        let url = URLs.getUser + user
        let headers = [ "Authorization": "Bearer \(token)"]
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: URLEncoding.default, headers: headers).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    success?(json)
                }
            case .failure(let error):
                print(error)
                failure?()
            }
        }
    }
}

extension APIManager {
    static let shared = APIManager()
}
