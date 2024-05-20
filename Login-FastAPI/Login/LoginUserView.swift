import SwiftUI

struct LoginUserView: View {
    @StateObject var loginVM = LoginUserVM()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Login")
                    .fontWeight(.bold)
                    .font(.system(size: 45))
                    .padding(.bottom)
                
                Spacer()
                
                // TextField to get user username
                TextField("Enter Username", text: $loginVM.username)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                
                // SecureField to get and hide password
                SecureField("Enter Password", text: $loginVM.password)
                    .autocapitalization(.none)
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(8.0)
                    .padding(.horizontal)
                
                // Login button with action
                Button(action: {
                    loginVM.login_user(request: TokenRequest(username: loginVM.username, password: loginVM.password))
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
                NavigationLink(destination: CreateUserView().navigationBarBackButtonHidden(true)){
                    Text("Don't have account? Sign up")
                        
                }
                Spacer()
                Spacer()
            }
            .ignoresSafeArea(.keyboard)
            .navigationDestination(isPresented: $loginVM.isLoggedIn) {
                HomePageView(accessToken: loginVM.accessToken)
            }
            .dismissKeyboardOnTap()
        }
    }
}

#Preview {
    LoginUserView(loginVM: LoginUserVM())
}
