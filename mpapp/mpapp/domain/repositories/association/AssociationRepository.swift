import Foundation

class AssociationRepository: IAssociationRepository{
    
    private let localAssociationDataSource: ILocalAssociationDataSource
    
    init(localAssociationDataSource: ILocalAssociationDataSource) {
        self.localAssociationDataSource = localAssociationDataSource
    }
    
    func insertAssociation(associationTWTP: AssociationTPTW) throws {
        try self.localAssociationDataSource.insertAssociation(associationTWTP: associationTWTP)
    }
    
    func insertAssociations(associations: Array<AssociationTPTW>) throws {
        try self.localAssociationDataSource.insertAssociations(associations: associations)
    }
    
}
