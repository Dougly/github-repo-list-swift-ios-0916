//
//  FISReposTableViewController.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposTableViewController: UITableViewController {
    
    var store = ReposDataStore.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.accessibilityLabel = "tableView"
        
        store.getRepositoriesFromAPI {
            print(self.store.repositories.count)

            DispatchQueue.main.async {
                // your code that touches the UI here, like, maybe:
                self.tableView.reloadData()
            }
        }
        print(store.repositories.count)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print(store.repositories.count)
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return store.repositories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "repoCell")
        cell?.textLabel?.text = store.repositories[indexPath.row].fullName
        
        return cell!
    }

}
