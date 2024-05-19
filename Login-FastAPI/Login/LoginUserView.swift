//
//  CreateUserView.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//


import SwiftUI

struct LoginUserView: View {
    @StateObject var loginVM = LoginUserVM()
        
        var body: some View {
            VStack {
                Text("Login")
                    .fontWeight(.bold)
                    .font(.system(size: 45))
                    .padding(.bottom)
                
                Spacer()
                
                // TextField to get user email
                TextField("Enter username", text: $loginVM.username)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                
                // TextField to get and hide password
                SecureField("Enter Password", text: $loginVM.password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                
                // Login button with action
                Button(action: {
                    loginVM.login_user(request: TokenRequest(username: loginVM.username, password: loginVM.password) )
                }) {
                    // Login button text
                    Text("Login")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }
                .padding()
                
                Spacer()
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .background(NavigationLink(destination: WelcomeView, label: <#T##() -> View#>))
        }
    }

#Preview {
    LoginUserView(loginVM: LoginUserVM())
}
