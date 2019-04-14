//
//  SearchViewController.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 4/14/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        APIManager.shared.getAccessToken(success: { isSuccess in
            
        }) { error in
            
        }
    }
}

