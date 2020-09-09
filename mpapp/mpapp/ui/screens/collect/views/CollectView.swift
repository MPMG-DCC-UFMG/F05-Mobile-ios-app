import SwiftUI

struct CollectView: View {
    
    var onBackPressed: (() -> Void)?
    var publicWork: PublicWork
    
    var body: some View {
        ZStack{
            ColorProvider.darkBackground.edgesIgnoringSafeArea(.all)
            VStack{
                HStack{
                    Button(action:{
                        self.onBackPressed?()
                    }){
                        Image(systemName: "arrow.left")
                        .font(.system(size: 28.0))
                        .h1()
                    }.padding(.horizontal,20)
                    Spacer()
                    Text(self.publicWork.name)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .multilineTextAlignment(.leading)
                        .padding(.trailing,40)
                        .h2()
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct CollectView_Previews: PreviewProvider {
    static var previews: some View {
        CollectView(publicWork: PublicWork())
    }
}
