//
//  SearchViewController.swift
//  SwiftyCompanion
//
//  Created by Anastasia Veremiichyk on 4/14/19.
//  Copyright © 2019 Anastasia Veremiichyk. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    var user: User? = nil
    let dataService = DataService()

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData() {
        if APIManager.shared.token == "" {
            getToken()
        } else {
            checkToken()
        }
    }
    
    func getToken() {
        APIManager.shared.getAccessToken(success: { isSuccess in
            
        }) { error in
            
        }
    }
    
    func checkToken() {
        APIManager.shared.checkAccessToken()
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else { return }
        
        // loader
        APIManager.shared.searchUser(user: text.lowercased(), success: { [weak self] json in
            guard let self = self else { return }
            
            self.user = self.dataService.parseUser(from: json)
        }) {
            // loader stop
            // user not found pop up
        }
    }
}
