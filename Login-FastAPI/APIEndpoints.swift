//
//  APIEndpoints.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import Foundation

// APIEnpoints
struct APIEndpoints {
    // insert your baseURL here
    static let baseURL = "https://sfguys.org"
    // actions
    static let createUser = "\(baseURL)/user/create"
    static let token = "\(baseURL)/login"
}
