import Foundation

class WorkStatusViewModel: ObservableObject {
    
    private let typeWorkRepository: TypeWorkRepository
    private let workStatusRepository: WorkStatusRepository
    
    init(typeWorkRepository: TypeWorkRepository,
         workStatusRepository: WorkStatusRepository){
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
