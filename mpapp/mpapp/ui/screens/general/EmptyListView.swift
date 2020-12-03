import SwiftUI

struct EmptyListView: View {
    
    var emptyMessage: String
    
    var body: some View {
        VStack{
            Spacer()
            Text(emptyMessage).h1().padding(10)
            Spacer()
        }
    }
}

struct EmptyListView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyListView(emptyMessage: "Lista vazia")
    }
}
