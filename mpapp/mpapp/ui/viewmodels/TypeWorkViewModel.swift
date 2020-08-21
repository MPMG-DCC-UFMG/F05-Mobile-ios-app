import Foundation
import RealmSwift
import RxSwift
import RxRealm

class TypeWorkViewModel: ObservableObject{
    
    var index = 6
    
    @Published var typeworks = [TypeWork]()
    
    private let typeWorkRepository: ITypeWorkRepository
    
    init(typeWorkRepository: ITypeWorkRepository){
        self.typeWorkRepository = typeWorkRepository
        fetchTypeWorks()
    }
    
    func fetchTypeWorks() {
        Observable.array(from: typeWorkRepository.listAllTypeWorks()).subscribe(onNext:{ array in
            self.typeworks = array
        })
    }
    
    func addTypeWork(){
        let typeWork = TypeWork.fromValues(flag: index,name: "teste \(index)",status: "1,2,3,4")
        index+=1
        typeWorkRepository.insertTypeWork(typeWork: typeWork)
    }
}
