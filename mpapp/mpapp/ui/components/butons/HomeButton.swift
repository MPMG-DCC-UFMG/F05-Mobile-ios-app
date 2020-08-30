import SwiftUI

struct HomeButton: View {
    
    var action: () -> Void
    var label:String
    var image:String
    
    var body: some View {
        Button(action: action) {
            HStack {
                ZStack{
                    Image(image)
                        .renderingMode(.original)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 25, height: 25)
                }.frame(width: 50, height: 50)
                    .background(ColorProvider.grey2)
                    .clipShape(Circle())
                
                Text(label)
                    .buttonTextStyle(color:ColorProvider.white)
                    .padding(.vertical,20)
                    .padding(.horizontal,5)
                Spacer()
                
                Image(systemName: "chevron.right")
                    .font(.system(size: 18.0))
                    .foregroundColor(ColorProvider.white)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            .frame(height: 30)
            .padding()
            .background(ColorProvider.grey1)
            .cornerRadius(8)
        }
    }
}

struct HomeButton_Previews: PreviewProvider {
    static var previews: some View {
        HomeButton(action: {}, label: "Lista", image: "list")
    }
}
