import SwiftUI

struct ImageFeedView: View {
    let images: [ImageItem] = [
        ImageItem(imageName: "image1"),
        ImageItem(imageName: "image2"),
        ImageItem(imageName: "image3"),
        ImageItem(imageName: "image4")
    ]
    
    var body: some View {
        NavigationView {
            List(images) { imageItem in
                Image(imageItem.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                    .padding()
            }
            .navigationTitle("Image Feed")
        }
    }
}

#Preview {
    ImageFeedView()
}
