import Foundation

class SyncUI: ObservableObject{
    
    private var publicWork: PublicWork
    
    @Published var name: String = ""
    @Published var syncMessage: String = "Novos dados para enviar"
    @Published var syncProgress: Int = 0
    
    init(_ publicWork: PublicWork){
        self.publicWork = publicWork
        self.name = publicWork.name
    }
}
