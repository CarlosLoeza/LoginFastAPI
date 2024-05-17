//
//  CreateUserVM.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import SwiftUI


class CreateUserVM: ObservableObject {
    @Published var username = ""
    @Published var email = ""
    @Published var confirmedEmail = ""
    @Published var password = ""
    @Published var profile_s3_path = ""
    @Published var bio = ""
    @Published var date_of_birth = ""
    @Published var phone_number = ""
    @Published var userMessage: String?
    @Published var accessToken: String?
    @Published var errorMessage: String?
    
    func createUser(request: CreateUserRequest){
        NetworkManager.shared.createUser(request: request){[weak self] result in
            print("result: \(result)")
            print("Request: \(request.username)")
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self!.userMessage = response.message
                    print("-- Create User Success --")
                    print("User message: \(self!.userMessage!)")
                case .failure(let error):
                    print("error")
                    print(error.localizedDescription)
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}


