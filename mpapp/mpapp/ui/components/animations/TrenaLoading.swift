import SwiftUI

struct TrenaLoading: View {
    
    var isLoading: Bool
    var message: String
    
    var body: some View {
        VStack{
            if(isLoading){
                Circle()
                    .trim(from: 0, to: 0.7)
                    .stroke(ColorProvider.greenTrena, lineWidth: 10)
                    .frame(width: 100, height: 100)
                    .rotationEffect(Angle(degrees: isLoading ? 360 : 0))
                    .animation(Animation.default.repeatForever(autoreverses: false))
            }
            Text(message).h1()
                .multilineTextAlignment(.center)
        }
        
    }
}

struct TrenaLoading_Previews: PreviewProvider {
    static var previews: some View {
        TrenaLoading(isLoading: true,message: "Carregando")
    }
}
