import Foundation

class CollectUI: ObservableObject {
    var date = Date().currentTimeMillis()
    @Published var comments: String? = nil
    var publicWorkStatus = 0
    var idPublicWork: String = ""
    
    private var collect: Collect
    
    init(_ collect: Collect = Collect()) {
        self.collect = collect
        comments = collect.comments
        idPublicWork = collect.idPublicWork
        publicWorkStatus = collect.publicWorkStatus
    }
    
    func getCollect() -> Collect{
        return collect
    }
    
    func getId() -> String{
        return collect.id
    }
    
    func toDB() -> Collect{
        collect.comments = comments
        collect.date = date
        collect.publicWorkStatus = publicWorkStatus
        collect.idPublicWork = idPublicWork
        collect.isSent = false
        return collect
    }
}
