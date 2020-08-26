import SwiftUI

struct SignInButton: View {
    
    var action: () -> Void
    var label:String
    var image:String
    var backgroundColor: Color
    var textColor: Color
    
    var body: some View {
       Button(action: action) {
            HStack {
                Image(image)
                    .renderingMode(.original)
                .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                Text(label)
                    .buttonTextStyle(color:textColor)
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 25)
            .padding()
            .foregroundColor(textColor)
            .background(backgroundColor)
            .cornerRadius(4)
        }
    }
}

struct SignInButton_Previews: PreviewProvider {
    static var previews: some View {
        SignInButton(action: {},label: "Entre com Google", image: "google_logo",backgroundColor: ColorProvider.white, textColor: ColorProvider.grey2)
    }
}
