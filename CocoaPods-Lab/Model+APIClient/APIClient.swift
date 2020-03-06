//
//  APIClient.swift
//  CocoaPods-Lab
//
//  Created by Kelby Mittan on 3/5/20.
//  Copyright © 2020 Kelby Mittan. All rights reserved.
//

import Foundation
import Alamofire

struct APIClient {
    
    static func fetchUsers(completion: @escaping (AFResult<[User]>) -> ()) {
        let endpointURLString = "https://randomuser.me/api/?results=100"
        
        guard let url = URL(string: endpointURLString) else {
            return
        }
        
        AF.request(url).response { (response) in
            
            if let error = response.error {
                completion(.failure(error))
            } else if let data = response.data {
                do{
                    let results = try JSONDecoder().decode(ResultsWrapper.self, from: data)
                    let users = results.results
                    completion(.success(users))
                } catch {
                    print("oops")
                }
            }
        }
    }
    
}
