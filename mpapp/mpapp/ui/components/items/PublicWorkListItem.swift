import SwiftUI

struct PublicWorkListItem: View {
    var publicWork: PublicWork
    
    var body: some View {
        VStack{
            HStack{
                Text("\(publicWork.name)").h2()
                Spacer()
                Text("200m").h3()
            }
            HStack{
                Text("\(publicWork.formatedAddress())").h4()
                Spacer()
            }.padding(.top,10)
            
        }.padding()
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(ColorProvider.grey3)
        .cornerRadius(8)
    }
}

struct PublicWorkListItem_Previews: PreviewProvider {
    static var publicWork = PublicWork()
    
    init(){
        PublicWorkListItem_Previews.publicWork.name = "Teste"
    }
    
    static var previews: some View {
        PublicWorkListItem(publicWork: PublicWorkListItem_Previews.publicWork)
    }
}
