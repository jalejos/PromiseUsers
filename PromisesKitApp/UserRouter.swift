//
//  UserRouter.swift
//  PromisesKitApp
//
//  Created by Alejos on 4/24/17.
//  Copyright © 2017 Alejos. All rights reserved.
//

import Alamofire

enum UserRouter: URLRequestConvertible {
    
    case getUsers()
    case getUsersSecure()
    
    var path: String {
        switch self {
        case .getUsers():
            return "/"
        case .getUsersSecure():
            return "/users"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        var urlRequest = URLRequest(url: APIManager.baseURL.appendingPathComponent(path))
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        return urlRequest
    }
    
}
