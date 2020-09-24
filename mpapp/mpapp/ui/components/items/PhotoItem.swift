import SwiftUI

struct PhotoItem: View {
    
    var photoUI: PhotoUI
    
    var body: some View {
        VStack{
            HStack{
                Text("\(photoUI.typePhotoName ?? "Foto")").h2()
                Spacer()
                Image(uiImage: photoUI.loadImage() ?? UIImage())
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 68, height: 54)
                    .background(ColorProvider.grey3)
                    .cornerRadius(8, corners: [.topLeft, .topRight,.bottomLeft,.bottomRight])
            }
        }.padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(ColorProvider.grey2)
            .cornerRadius(8)
    }
}

struct PhotoItem_Previews: PreviewProvider {
    static var previews: some View {
        PhotoItem(photoUI: PhotoUI())
    }
}
