//
//  FISGithubAPIClient.swift
//  github-repo-list-swift
//
//  Created by  susan lovaglio on 10/23/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit

class GithubAPIClient {
    
    class func getRepositories(with completion: @escaping ([[String : Any]]) -> Void ) {
        
        let urlString = "https://api.github.com/repositories?client_id=\(clientID)&client_secret=\(secretID)"
        
        let url = URL(string: urlString)
        
        let session = URLSession.shared
        
        if let url = url {
            let task = session.dataTask(with: url) { (data, response, error) in
                
                if let data = data {
                    
                    do {
                        let responseJSON = try JSONSerialization.jsonObject(with: data, options: []) as! [[String : Any]]
                        //dump(responseJSON) - have correct data
                        completion(responseJSON)
                    } catch {
                        
                    }
                }
            }
            task.resume()
        }
    }
    
}


    


