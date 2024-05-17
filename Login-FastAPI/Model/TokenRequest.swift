//
//  TokenRequest.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import Foundation

struct TokenRequest: Codable {
    let username: String
    let password: String
}
