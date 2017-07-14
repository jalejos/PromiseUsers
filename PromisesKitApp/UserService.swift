//
//  UserService.swift
//  PromisesKitApp
//
//  Created by Alejos on 4/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import PromiseKit
import ObjectMapper

struct UserService {
    
    static let noContentError = NSError.init(domain: "", code: 204, userInfo: nil)
    
    static func getUsers() -> Promise<[User]> {
            return UserRepository.getUsers()
                    .then(execute: { json -> [User] in
                        if let users = Mapper<User>().mapArray(JSONArray: json) {
                            return users
                        } else {
                            return []
                        }
                    })
    }
    
    static func getUsersSecure() -> Promise<[User]> {
        return UserRepository.getUsersSecure()
            .then(execute: { json -> [User] in
                if let users = Mapper<User>().mapArray(JSONArray: json) {
                    return users
                } else {
                    return []
                }
            })
    }
    
}
