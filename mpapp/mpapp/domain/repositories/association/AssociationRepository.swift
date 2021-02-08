import Foundation

class AssociationRepository{
    
    private let localAssociationDataSource: LocalAssociationDataSource
    
    init(localAssociationDataSource: LocalAssociationDataSource) {
        self.localAssociationDataSource = localAssociationDataSource
    }
    
    func insertAssociation(associationTWTP: AssociationTPTW) throws {
        try self.localAssociationDataSource.insertAssociation(associationTWTP: associationTWTP)
    }
    
    func insertAssociations(associations: Array<AssociationTPTW>) throws {
        try self.localAssociationDataSource.insertAssociations(associations: associations)
    }

    func deleteAssociations() throws {
        try self.localAssociationDataSource.deleteAssociations()
    }
}
