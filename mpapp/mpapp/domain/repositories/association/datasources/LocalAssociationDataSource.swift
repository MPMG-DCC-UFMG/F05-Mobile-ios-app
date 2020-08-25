import Foundation

class LocalAssociationDataSource:BaseDataSource<AssociationTPTW>,ILocalAssociationDataSource{
    
    func insertAssociation(associationTWTP: AssociationTPTW) throws{
        try self.insert(entity: associationTWTP)
    }
    
    func insertAssociations(associations: Array<AssociationTPTW>)throws {
        try self.insertAll(entities: associations)
    }
        
}
