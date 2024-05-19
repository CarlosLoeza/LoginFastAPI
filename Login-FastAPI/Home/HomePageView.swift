import SwiftUI

struct HomePageView: View {
    var accessToken: String
    
    var body: some View {
        VStack {
            Text("Welcome!")
                .font(.largeTitle)
                .padding()
            Text("Access Token:")
                .font(.title2)
                .padding()
            Text(accessToken)
                .padding()
            Spacer()
        }
        .navigationBarTitle("Welcome", displayMode: .inline)
    }
}

#Preview {
    HomePageView(accessToken: "SampleAccessToken")
}
