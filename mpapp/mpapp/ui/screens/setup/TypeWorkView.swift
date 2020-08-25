import Foundation
import SwiftUI
import Resolver
import RealmSwift

struct ContentView: View {
    
    @ObservedObject var typeWorkViewModel: TypeWorkViewModel = Resolver.resolve()
    
    var body: some View {
        VStack(){
            List(typeWorkViewModel.typeworks){typeWork in
                TypeWorkRow(typeWork: typeWork)
            }
            Spacer()
        }
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
