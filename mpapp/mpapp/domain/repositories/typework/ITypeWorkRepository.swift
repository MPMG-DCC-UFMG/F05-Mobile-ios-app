import Foundation

protocol ITypeWorkRepository: ILocalTypeWorkDataSource {
    
    func getTypeWorkByFlag(typeWorkFlag: Int) -> TypeWork?
}
