import SwiftUI

struct BottomNavBar: View {
    @State private var isCameraPresented = false;
    var body: some View {
        HStack {
            Spacer()
            NavigationLink(destination: HomePageView(accessToken: "Hello")) {
                VStack {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
            }
            Spacer()
            NavigationLink(destination: HomePageView(accessToken: "hello")) {
                VStack {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
            }
            Spacer()
                        Button(action: {
                            isCameraPresented.toggle()
                        }) {
                            VStack {
                                Image(systemName: "camera.fill")
                                    .font(.largeTitle)
                                Text("Camera")
                            }
                        }
                        .fullScreenCover(isPresented: $isCameraPresented) {
                            CameraView()
                                .ignoresSafeArea(.all)
                        }
            Spacer()
            NavigationLink(destination: HomePageView(accessToken: "Hello")) {
                VStack {
                    Image(systemName: "gearshape.fill")
                    Text("Settings")
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.2))
    }
}

#Preview {
    BottomNavBar()
}
