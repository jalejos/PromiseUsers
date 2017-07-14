//
//  UserRepository.swift
//  PromisesKitApp
//
//  Created by Alejos on 4/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Alamofire
import PromiseKit

struct UserRepository {
    static func getUsers() -> Promise <[[String:Any]]> {
        return Promise { fulfill, _ in
            Alamofire.request(UserRouter.getUsers()).responseJSON{ (response) in
                if let json = response.result.value as? [[String:Any]] {
                    fulfill(json)
                } else {
                    fulfill([])
                }
            }
        }
    }
    
    static func getUsersSecure() -> Promise <[[String:Any]]> {
        return Promise { fulfill, reject in
            Alamofire.request(UserRouter.getUsersSecure()).responseJSON{ (response) in
                if let json = response.result.value as? [[String:Any]] {
                    fulfill(json)
                } else if let responseError = response.error {
                    reject(responseError)
                } else {
                    fulfill([])
                }
            }
        }
    }
}
