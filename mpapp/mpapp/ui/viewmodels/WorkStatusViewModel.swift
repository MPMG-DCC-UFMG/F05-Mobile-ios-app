import Foundation

class WorkStatusViewModel: ObservableObject {
    
    private let typeWorkRepository: ITypeWorkRepository
    private let workStatusRepository: IWorkStatusRepository
    
    init(typeWorkRepository: ITypeWorkRepository,
         workStatusRepository: IWorkStatusRepository){
        self.typeWorkRepository = typeWorkRepository
        self.workStatusRepository = workStatusRepository
    }
    
    func getWorkStatusesForPublicWork(_ publicWork: PublicWorkUI) -> [WorkStatus]{
        guard let typeWork = typeWorkRepository.getTypeWorkByFlag(typeWorkFlag: publicWork.typeWorkFlag) else {
            return []
        }
        let workStatuses = typeWork.getWorkStatusIds()
        return workStatusRepository.listWorKStatusByFlags(workStatusFlags: workStatuses).toArray()
    }
}
