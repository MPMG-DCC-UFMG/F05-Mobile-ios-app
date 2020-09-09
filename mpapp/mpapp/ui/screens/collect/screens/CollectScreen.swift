import SwiftUI

struct CollectScreen: View {
    
    var onBackPressed: (() -> Void)?
    var publicWork: PublicWork
    
    var body: some View {
        CollectView(onBackPressed: self.onBackPressed, publicWork: self.publicWork)
    }
}

struct CollectScreen_Previews: PreviewProvider {
    static var previews: some View {
        CollectScreen( publicWork: PublicWork())
    }
}
