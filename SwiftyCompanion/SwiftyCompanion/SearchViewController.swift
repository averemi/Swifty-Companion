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
    @IBOutlet weak var tableView: UITableView!
    var user: User? = nil
    let dataService = DataService()

    override func viewDidLoad() {
        super.viewDidLoad()

        user = nil
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
            // unable to get token pop up
        }
    }
    
    func checkToken() {
        APIManager.shared.checkAccessToken()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let user = user else { return }

        if segue.identifier == "goToProfile" {
            guard let newViewController = segue.destination as? ProfileViewController else { return }
            
            newViewController.user = user
        }
    }
}

// MARK: - UITableViewController
extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (user != nil) ? 1 : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        guard let user = user else { return cell }
        cell.configure(user: user)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        performSegue(withIdentifier: "goToProfile", sender: self)
    }
}

// MARK: - UISearchBarDelegate
extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        user = nil
        guard let text = searchBar.text else { return }
        
        // loader
        checkToken()
        APIManager.shared.searchUser(user: text.lowercased(), success: { [weak self] json in
            guard let self = self else { return }
            
            self.user = self.dataService.parseUser(from: json)
            self.tableView.reloadData()
        }) { [weak self] in
            guard let self = self else { return }
            self.tableView.reloadData()
            // loader stop
            // user not found pop up
        }
    }
}
