import SwiftUI

struct HomeScreen: View {
    
    @State private var onList = false
    
    var body: some View {
        ZStack{
            if onList{
                PublicWorkListView()
            }else{
                HomeView(onList: $onList)
            }
            
        }
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
