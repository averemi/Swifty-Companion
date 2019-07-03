//
//  ViewController + Extension.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 7/3/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

extension UIViewController {
    func showPopUp(with message: String) {
        let alert = UIAlertController(title: "", message: message, preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
