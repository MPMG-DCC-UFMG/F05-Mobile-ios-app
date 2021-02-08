import Foundation
import RealmSwift
import RxSwift
import RxRealm
import SwiftUI

class PublicWorkAddViewModel : BaseViewModel, ObservableObject{
    
    var typeworks = [TypeWork]()
    private let publicWorkRepository: PublicWorkRepository
    private let typeWorkRepository: TypeWorkRepository
    private var publicWork: PublicWork
    private var address : Address
    
    
    init(publicWorkRepository: PublicWorkRepository, typeWorkRespository: TypeWorkRepository){
        self.typeWorkRepository = typeWorkRespository
        self.typeworks = typeWorkRepository.listAllTypeWorks().toArray()
        self.publicWorkRepository = publicWorkRepository
        self.publicWork = PublicWork()
        self.address = Address()
        self.publicWork.address = self.address
    }
    
    @Published var currTypeWorkName: String = ""
    @Published var name: String = ""
    @Published var cep: String = ""
    @Published var number: String = ""
    @Published var street: String = ""
    @Published var neighborhood: String = ""
    @Published var city: String = ""
    @Published var latitude: Double = 0.0
    @Published var longitude: Double = 0.0
    var idCollect: String? = nil
    var typeWorkFlag = 0
    var toSend: Bool = false
    
    func isPublicWorkValid() -> Bool{
        return !name.isEmpty
    }
    
    func isLocationValid() -> Bool{
        return latitude != 0.0 && longitude != 0.0
    }
    
    func formatedAddress() -> String{
        return "\(street), \(number) - \(neighborhood) , \(city) - \(cep)"
    }
    
    func getId() -> String{
        return publicWork.id
    }
    
    func updateAddress(_ address: Address){
        self.address = address
        self.cep = address.cep
        self.number = address.number
        self.street = address.street
        self.neighborhood = address.neighborhood
        self.city = address.city
        self.latitude = address.latitude
        self.longitude = address.longitude
    }
    
    private func initValues(_ publicWork: PublicWork) {
        self.publicWork = publicWork
        self.typeWorkFlag = publicWork.typeWorkFlag
        self.idCollect = publicWork.idCollect
        self.toSend = publicWork.toSend
        self.address = publicWork.address ?? Address()
        self.name = publicWork.name
        self.cep = address.cep
        self.number = address.number
        self.street = address.street
        self.neighborhood = address.neighborhood
        self.city = address.city
        self.latitude = address.latitude
        self.longitude = address.longitude
    }
    
    private func toDbModel() -> PublicWorkUI{
        let publicWork: PublicWorkUI = PublicWorkUI(self.publicWork)
        publicWork.name = self.name
        publicWork.typeWorkFlag = self.typeWorkFlag
        publicWork.idCollect = self.idCollect
        publicWork.toSend = true
        publicWork.latitude = self.latitude
        publicWork.longitude = self.longitude
        publicWork.cep = self.cep
        publicWork.city = self.city
        publicWork.latitude = self.latitude
        publicWork.longitude = self.longitude
        publicWork.neighborhood = self.neighborhood
        publicWork.number = self.number
        publicWork.street = self.street
        return publicWork
    }
    
    func update(_ publicWork: PublicWork){
        self.publicWork.name = publicWork.name
        self.publicWork.address = publicWork.address
        self.publicWork.idAddress = publicWork.address!.id
        self.publicWork.typeWorkFlag = publicWork.typeWorkFlag
        self.publicWork.idCollect = publicWork.idCollect
        self.publicWork.toSend = true
        self.address.idPublicWork = publicWork.id
        self.address.cep = publicWork.address!.cep
        self.address.city = publicWork.address!.city
        self.address.latitude = publicWork.address!.latitude
        self.address.longitude = publicWork.address!.longitude
        self.address.neighborhood = publicWork.address!.neighborhood
        self.address.number = publicWork.address!.number
        self.address.street = publicWork.address!.street
    }
    
    func getTypeWorkByFlag(_ typeWorkFlag: Int) -> TypeWork?{
        return self.typeworks.filter{$0.flag==typeWorkFlag}.first
    }
    
    func navigateBack(){
        self.navController.navigateBack()
    }
    
    func initPublicWorkUi(publicWorkId: String? = nil){
        
        guard let id = publicWorkId else {
            newPublicWork()
            return
        }
        findPublicWork(id)
    }
    
    private func newPublicWork(){
        typeWorkFlag = typeworks.first!.flag
        self.publicWork.typeWorkFlag = typeWorkFlag
        initValues(self.publicWork)
        updateCurrTypeWorkName(typeWorkName: typeworks.first!.name)
    }
    
    private func findPublicWork(_ publicWorkId: String){
        guard let publicWork = self.publicWorkRepository.getPublicWorkById(publicWorkId: publicWorkId) else {
            newPublicWork()
            return
        }
        let typeWork = getTypeWorkByFlag(publicWork.typeWorkFlag) ?? typeworks.first!
        initValues(publicWork)
        updateCurrTypeWorkName(typeWorkName: typeWork.name)
    }
    
    func getTypeWorkOptions() -> [String] {
        return typeworks.map({ $0.name })
    }
    
    func updateCurrTypeWorkName(typeWorkName: String) {
        self.currTypeWorkName = typeWorkName
    }
    
    func goToMap(){
        self.navController.navigateTo(AnyView(PublicWorkLocationView(onConfirmClicked:newAddress)))
    }
    
    private func newAddress(address: Address){
        updateAddress(address)
    }
    
    func addPublicWork(){
        do{
            try publicWorkRepository.insertPublicWork(publicWork: toDbModel())
            navigateBack()
        }catch{
            print(error)
        }
        
    }
}
