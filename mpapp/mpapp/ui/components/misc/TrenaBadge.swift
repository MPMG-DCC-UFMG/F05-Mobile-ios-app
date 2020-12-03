import SwiftUI

struct TrenaBadge: View {
    
    var badgeNumber: String
    
    var body: some View {
        ZStack{
            Text(badgeNumber).h5(color: ColorProvider.white)
        }.frame(width: 18, height: 18)
        .background(ColorProvider.red)
        .clipShape(Circle())
        
    }
}

struct TrenaBadge_Previews: PreviewProvider {
    static var previews: some View {
        TrenaBadge(badgeNumber: "3")
    }
}
