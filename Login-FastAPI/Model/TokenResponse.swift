//
//  TokenResponse.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import Foundation

struct TokenResponse: Codable {
    let access_token: String
    let token_type: String
}
