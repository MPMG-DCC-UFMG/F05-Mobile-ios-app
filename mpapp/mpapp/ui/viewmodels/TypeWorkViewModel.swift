import Foundation
import RealmSwift
import RxSwift
import RxRealm

class TypeWorkViewModel: ObservableObject{
        
    @Published var typeworks = [TypeWork]()
    
    private let typeWorkRepository: ITypeWorkRepository
    
    init(typeWorkRepository: ITypeWorkRepository){
        self.typeWorkRepository = typeWorkRepository
        fetchTypeWorks()
    }
    
    func fetchTypeWorks() {
        Observable.array(from: typeWorkRepository.listAllTypeWorks()).subscribe(onNext:{ array in
            self.typeworks = array
            }).dispose()
    }
    
    func getTypeWorkByFlag(_ typeWorkFlag: Int) -> TypeWork?{
        return self.typeworks.filter{$0.flag==typeWorkFlag}.first
    }
}
