import SwiftUI

struct ImageButton: View {
    let onClick: (() -> Void)?
    let width: CGFloat
    let image: String
    let backgroundColor: Color
    
    var body: some View {
        Button(action: {
            self.onClick?()
        }, label: {
            Image(image)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: width/2, height: width/2)
        })
            .frame(width: width, height: width)
            .background(backgroundColor)
            .cornerRadius(width/1.3)
            .padding(4)
    }
}

struct ImageButton_Previews: PreviewProvider {
    static var previews: some View {
        ImageButton(onClick: {}, width: 70,image:"show",backgroundColor: ColorProvider.blueFacebook)
    }
}
