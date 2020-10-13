import SwiftUI
import Resolver

struct SyncListItem: View {
    
    @ObservedObject var syncUI: SyncUI
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(syncUI.name)").h2(color: ColorProvider.white)
                Spacer()
                Text("\(syncUI.progress) %").h2()
            }
            Text("\(syncUI.message)").h4().padding(.vertical,5)
            Divider().background(ColorProvider.grey4)
        }.padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(ColorProvider.darkBackground)
    }
}

struct SyncListItem_Previews: PreviewProvider {
    static var syncUI = SyncUI(PublicWork())
    
    init(){
        SyncListItem_Previews.syncUI.name = "Teste"
    }
    
    static var previews: some View {
        SyncListItem(syncUI: SyncListItem_Previews.syncUI)
    }
}
