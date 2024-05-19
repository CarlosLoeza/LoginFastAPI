//
//  CreateUserVM.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import SwiftUI


class LoginUserVM: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var accessToken = ""
    @Published var errorMessage = ""
    @Published var isLoggedIn = false
  
    
    func login_user(request: TokenRequest){
        NetworkManager.shared.getToken(request: request){[weak self] result in
            print("result: \(result)")
            print("Request: \(request.username)")
            DispatchQueue.main.async {
                switch result {
                case .success(let response):
                    self!.accessToken = response.access_token
                    print("Successful login")
                    print("Token: \(self!.accessToken)")
                    self?.isLoggedIn = true;
                case .failure(let error):
                    print("error")
                    print(error.localizedDescription)
                    self?.errorMessage = error.localizedDescription
                }
            }
        }
    }
}


