import SwiftUI

struct HomePageView: View {
    var accessToken: String
    
    var body: some View {
        VStack {
            ImageFeedView()
            BottomNavBar()
        }
        .navigationBarTitle("Welcome", displayMode: .inline)
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    HomePageView(accessToken: "SampleAccessToken")
}
