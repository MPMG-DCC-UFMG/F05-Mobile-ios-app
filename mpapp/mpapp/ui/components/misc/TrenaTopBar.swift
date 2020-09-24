import SwiftUI

struct TrenaTopBar: View {
    
    let title: String
    var onBackPressed: (() -> Void)?
    
    var body: some View {
        HStack{
            Button(action:{
                self.onBackPressed?()
            }){
                Image(systemName: "arrow.left")
                .font(.system(size: 28.0))
                .h1()
            }.padding(.horizontal,15)
            Spacer()
            Text(title)
                .frame(minWidth: 0, maxWidth: .infinity)
                .multilineTextAlignment(.leading)
                .padding(.trailing,30)
                .h2()
            Spacer()
        }
    }
}

struct TrenaTopBar_Previews: PreviewProvider {
    static var previews: some View {
        TrenaTopBar(title: "Escola 2")
    }
}
