//
//  FISReposDataStore.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class ReposDataStore {
    
    static let sharedInstance = ReposDataStore()
    private init () {}
    
    var repositories: [GithubRepository] = []
    
    
    func getRepositoriesFromAPI(_ completion: @escaping () -> Void) {
        print("get repo FIRED")
        GithubAPIClient.getRepositories { data in
            self.repositories = []
            for repo in data {
                let newRepo = GithubRepository(dictionary: repo)
                self.repositories.append(newRepo)
            }
            
            completion()
        }
       
    }
    
}
