import Foundation

protocol ILocalAssociationDataSource {
    
    func insertAssociation(associationTWTP: AssociationTPTW) throws

    func insertAssociations(associations: Array<AssociationTPTW>) throws
}
