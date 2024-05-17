//
//  CreateUserRequest.swift
//  FastAPI-Login
//
//  Created by Carlos on 5/17/24.
//

import Foundation

struct CreateUserRequest: Codable {
    let username: String
    let password: String
    let email: String
    let profile_image_s3_path: String
    let bio: String
    let date_of_birth: String
    let phone_number: String
}
