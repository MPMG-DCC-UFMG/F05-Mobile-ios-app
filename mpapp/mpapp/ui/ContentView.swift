import SwiftUI
import Resolver
import RealmSwift

struct ContentView: View {
    
    @ObservedObject var typeWorkViewModel: TypeWorkViewModel = Resolver.resolve()
    
    var body: some View {
        VStack(){
            Button(action: {self.addTypeWork()}) {
                Text("Add")
            }
            List(typeWorkViewModel.typeworks){typeWork in
                TypeWorkRow(typeWork: typeWork)
            }
            Spacer()
        }
    }
    
    private func addTypeWork(){
        typeWorkViewModel.addTypeWork()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TypeWorkRow: View {
    var typeWork: TypeWork
    
    var body: some View {
        Text("\(typeWork.name)")
    }
}
