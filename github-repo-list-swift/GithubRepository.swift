//
//  FISGithubRepository.swift
//  github-repo-list-swift
//
//  Created by susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubRepository {
    let fullName: String
    let htmlURL: URL
    let repositoryID: String
    
    init(dictionary: [String : Any]) {
        
        self.fullName = dictionary["full_name"] as! String
        
        let urlAsString = dictionary["html_url"] as! String
        if let url = URL(string: urlAsString) {
            self.htmlURL = url
        } else {
            self.htmlURL = URL(string: urlAsString)!
        }
        
        let id = dictionary["id"] as! Int
        self.repositoryID = String(id)
    }

}
