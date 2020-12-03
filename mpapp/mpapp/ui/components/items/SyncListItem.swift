import SwiftUI
import Resolver

struct SyncListItem: View {
    
    @ObservedObject var syncUI: SyncUI
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text("\(syncUI.name)").h2(color: getTextColor())
                Spacer()
                Text("\(syncUI.progress) %").h2(color: getTextColor())
            }
            Text("\(syncUI.message)").h4().padding(.vertical,5)
            Divider().background(ColorProvider.grey4)
        }.padding()
            .frame(minWidth: 0, maxWidth: .infinity)
            .background(ColorProvider.darkBackground)
    }
    
    private func getTextColor() -> Color{
        if(syncUI.workerStatus == WorkerStatus.success){
            return ColorProvider.greenTrena
        }else{
            return ColorProvider.white
        }
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
