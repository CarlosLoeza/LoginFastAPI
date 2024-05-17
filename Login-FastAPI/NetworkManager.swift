//
//  NetworkManager.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//

import Foundation
import SwiftUI

class NetworkManager {
    static let shared = NetworkManager()
    
    private init(){}
    
    func createUser(request: CreateUserRequest, completion: @escaping (Result<CreateUserResponse, Error>) -> Void) {
        guard var urlComponents = URLComponents(string: APIEndpoints.createUser) else { return }
        
        urlComponents.queryItems = [
            URLQueryItem(name: "username", value: request.username),
            URLQueryItem(name: "password", value: request.password),
            URLQueryItem(name: "email", value: request.email),
            URLQueryItem(name: "profile_image_s3_path", value: request.profile_image_s3_path),
            URLQueryItem(name: "bio", value: request.bio),
            URLQueryItem(name: "date_of_birth", value: request.date_of_birth),
            URLQueryItem(name: "phone_number", value: request.phone_number)
        ]
        
        guard let url = urlComponents.url else { return }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            print("urlSession data: \(data)")
            if let jsonString = String(data: data, encoding: .utf8) {
                print("JSON Response: \(jsonString)")
            }
            print()
            do {
                let responseModel = try JSONDecoder().decode(CreateUserResponse.self, from: data)
                print("responseModel-create: \(responseModel)")
                completion(.success(responseModel))
            } catch {
                print("responseModel-create-failed: \(error)")
                completion(.failure(error))
            }
        }.resume()
        
        func getToken(request: TokenRequest, completion: @escaping (Result<TokenResponse, Error>) -> Void){
            guard let url = URL(string: APIEndpoints.token) else {return}
            
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = "POST"
            urlRequest.addValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            
            let bodyString = "username=\(request.username)&password=\(request.password)"
            urlRequest.httpBody = bodyString.data(using: .utf8)
            
            URLSession.shared.dataTask(with: urlRequest) {data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else {return}
                
                do {
                    let responseModel = try JSONDecoder().decode(TokenResponse.self, from: data)
                    completion(.success(responseModel))
                } catch {
                    completion(.failure(error))
                }
            }.resume()
        }
    }
}

