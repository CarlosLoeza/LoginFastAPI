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
    static let baseURL = "https://c067-2600-1700-2436-b010-ec98-75ab-a8cb-f390.ngrok-free.app"
    // actions
    static let createUser = "\(baseURL)/user/create"
    static let token = "\(baseURL)/token"
}
