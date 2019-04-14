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
    
    func getAccessToken(success: ((Bool)->Void)?, failure: ((String)->Void)?) {
        let url = URLs.getToken
        let params = [ "grant_type" : "client_credentials",
            "client_id": Constants.uid,
            "client_secret": Constants.clientSecret]
        
    /*    if let accToken = UserDefaults.standard.string(forKey: "accessToken") {
            
        }*/
        Alamofire.request(url, method: .post, parameters: params).validate().responseJSON {
            response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    self.token = json["access_token"].stringValue
                    UserDefaults.standard.set(self.token, forKey: "accessToken")
                    //NSUserDefaults.standardUserDefaults().setObject(json["access_token"].stringValue, forKey: "token")
                //    print("NEW token:", self.token)
                 //   self.check_token()
                }
            case .failure(let error):
                print(error)
            }
        }
    } /*else {
        self.token = verif as! String
        print("SAME token:", self.token)
        check_token()*/
    }
    
    
      //  let url = URL(string: "https://api.intra.42.fr/oauth/token?grant_type=authorization_code&client_id=\(ClientInfo.UID)&client_secret=\(ClientInfo.Secret)&code=\(self.userCode)&redirect_uri=\(ClientInfo.RedirectURI)")
       /* var request = URLRequest(url: url!)
        
        request.httpMethod = "POST"
        
        let task = URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            if let error = error {
                failure?(error.localizedDescription)
            } else if let dt = data {
                do {
                    if let dictionary: NSDictionary = try JSONSerialization.jsonObject(with: dt, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary {/Users/averemi/Projects/Swift/SwiftyCompanion/SwiftyCompanion/Podfile
                        if let token = dictionary["access_token"] as? String {
                            self.accessToken = token
                            success?(true)
                        }
                    }
                } catch {
                    failure?(error.localizedDescription)
                }
            }
        }
        task.resume()*/
  //  }
//}

extension APIManager {
    static let shared = APIManager()
}


/*  var token = String()
 let url = "https://api.intra.42.fr/oauth/token"
 let config = [
 "grant_type" : "client_credentials",
 "client_id": "1692f8821ba52f7303abbdeb915287fbb6c37e850ad4fd69aee62624083c0990",
 "client_secret": "71840f4841f04df776ea21f605b638fc7c3ddce20c8169d56488b5b46da6b35b"]
 
 func get_token() {
 let verif = NSUserDefaults.standardUserDefaults().objectForKey("token")
 if verif == nil {
 Alamofire.request(.POST, url, parameters: config).validate().responseJSON {
 response in
 switch response.result {
 case .Success:
 if let value = response.result.value {
 let json = JSON(value)
 self.token = json["access_token"].stringValue
 NSUserDefaults.standardUserDefaults().setObject(json["access_token"].stringValue, forKey: "token")
 print("NEW token:", self.token)
 self.check_token()
 }
 case .Failure(let error):
 print(error)
 }
 }
 } else {
 self.token = verif as! String
 print("SAME token:", self.token)
 check_token()
 }
 }
 
 private func check_token() {
 let check = NSURL(string: "https://api.intra.42.fr/oauth/token/info")
 let bearer = "Bearer " + self.token
 let request = NSMutableURLRequest(URL: check!)
 request.HTTPMethod = "GET"
 request.setValue(bearer, forHTTPHeaderField: "Authorization")
 Alamofire.request(request).validate().responseJSON {
 response in
 switch response.result {
 case .Success:
 if let value = response.result.value {
 let json = JSON(value)
 print("The token will expire in:", json["expires_in_seconds"], "seconds.")
 }
 case .Failure:
 print("Error: Trying to get a new token...")
 NSUserDefaults.standardUserDefaults().removeObjectForKey("token")
 self.get_token()
 }
 }
 }
 
 func check_user(user: String, completion: JSON? -> Void) {
 let userUrl = NSURL(string: "https://api.intra.42.fr/v2/users/" + user)
 let bearer = "Bearer " + self.token
 let request = NSMutableURLRequest(URL: userUrl!)
 request.HTTPMethod = "GET"
 request.setValue(bearer, forHTTPHeaderField: "Authorization")
 Alamofire.request(request).validate().responseJSON {
 response in
 switch response.result {
 case .Success:
 if let value = response.result.value {
 let json = JSON(value)
 completion(json)
 }
 case .Failure:
 completion(nil)
 print("Error: This login doesn't exists")
 }
 }
 }*/
