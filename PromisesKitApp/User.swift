//
//  User.swift
//  PromisesKitApp
//
//  Created by Alejos on 4/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Foundation
import ObjectMapper

class User: Mappable {
    dynamic var name: String = ""
    dynamic var username: String = ""
    dynamic var email: String = ""
    dynamic var phone: String = ""
    dynamic var website: String = ""
    
    convenience required init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name        <-  map["name"]
        username    <-  map["username"]
        email       <-  map["email"]
        phone       <-  map["phone"]
        website     <-  map["website"]
    }
}
