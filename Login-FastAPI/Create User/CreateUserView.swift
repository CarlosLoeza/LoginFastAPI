//
//  CreateUserView.swift
//  Login-FastAPI
//
//  Created by Carlos on 5/17/24.
//


import SwiftUI

struct CreateUserView: View {
    @StateObject var createUserVM = CreateUserVM()
    
    var body: some View {
        VStack {
            
            Text("Create User")
//                .font(.title)
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size: 45))
                .padding(.bottom)
            Spacer()
            // Textfield to get user email
            TextField("Enter Username", text: $createUserVM.username)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Enter Email", text: $createUserVM.email)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Enter Password", text: $createUserVM.password)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Confirm Password", text: $createUserVM.confirmedEmail)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Enter Profile Image", text: $createUserVM.profile_s3_path)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Enter Bio", text: $createUserVM.bio)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Enter Date of Birth (YYYY-MM-DD)", text: $createUserVM.date_of_birth)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)
            TextField("Enter Phone Number", text: $createUserVM.phone_number)
                .autocapitalization(.none)
                .padding()
                .background(Color(UIColor.systemGray6))
                .cornerRadius(8.0)
                .padding(.horizontal)


            
            // Textfield to get and hide password
       
//                PasswordInputView("Password", password: $createUserVM.password)
//                    .padding()
//                    .background(Color(UIColor.systemGray6))
//                    .cornerRadius(8.0)
//                .padding(.horizontal)
            

            
            // Login button with action
            Button(action: {
//                createUserVM.loginAttempt()
                let user = CreateUserRequest(username: createUserVM.username, password: createUserVM.password, email: createUserVM.email, profile_image_s3_path: createUserVM.profile_s3_path, bio: createUserVM.bio, date_of_birth: createUserVM.date_of_birth, phone_number: createUserVM.phone_number)
                createUserVM.createUser(request: user)
                
            }) {
                // Login button text
                Text("Create")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(8.0)
            }
            .padding()
//            .alert(isPresented: $createUserVM.showAlert){
//                Alert(title: Text("Invalid Credentials"), message: Text(createUserVM.alertMessage), dismissButton: .default(Text("OK")))
//            }
            
            
            Spacer()
            Spacer()
        }
        .ignoresSafeArea(.keyboard)
    }
}

#Preview {
    CreateUserView(createUserVM: CreateUserVM())
}
