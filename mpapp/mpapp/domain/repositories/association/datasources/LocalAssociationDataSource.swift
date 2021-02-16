import Foundation

class LocalAssociationDataSource:BaseDataSource<AssociationTPTW>{
    
    func insertAssociation(associationTWTP: AssociationTPTW) throws{
        try self.insert(entity: associationTWTP)
    }
    
    func insertAssociations(associations: Array<AssociationTPTW>)throws {
        try self.insertAll(entities: associations)
    }

    func deleteAssociations() throws {
        try self.deleteAll()
    }
}
