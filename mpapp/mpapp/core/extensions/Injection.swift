import Foundation
import Resolver

extension Resolver:ResolverRegistering{
    public static func registerAllServices() {
        // ViewModels
        register{TypeWorkViewModel(typeWorkRepository: resolve())}.scope(cached)
        register{LoginViewModel()}.scope(cached)
        register{ConfigurationViewModel()}.scope(cached)
        register{PublicWorkViewModel(publicWorkRepository: resolve())}.scope(cached)
        register{LocationViewModel()}.scope(cached)
        register{CollectViewModel(collectRepository: resolve(), publicWorkRepository: resolve())}.scope(cached)
        register{WorkStatusViewModel(typeWorkRepository: resolve(),workStatusRepository: resolve())}.scope(cached)
        register{TypePhotoViewModel(typePhotoRepository: resolve())}.scope(cached)
        register{PhotoViewModel()}.scope(cached)
        
        // Repositories
        register{TypeWorkRepository(localTypeWorkDataSource: resolve()) as ITypeWorkRepository}.scope(application)
        register{ConfigRepository(localConfigDataSource: resolve(), remoteConfigDataSource: resolve()) as IConfigRepository}.scope(application)
        register{TypePhotoRepository(localTypePhotoDataSource: resolve()) as ITypePhotoRepository}.scope(application)
        register{CityRepository(localCityDataSource: resolve()) as ICityRepository}.scope(application)
        register{WorkStatusRepository(localWorkStatusDataSource: resolve()) as IWorkStatusRepository}.scope(application)
        register{AssociationRepository(localAssociationDataSource: resolve()) as IAssociationRepository}.scope(application)
        register{PublicWorkRepository(localPublicWorkDataSource: resolve()) as IPublicWorkRepository}.scope(application)
        register{CollectRepository(localCollectDataSource:resolve()) as ICollectRepository}.scope(application)
        
        // LocalDataSources
        register{LocalTypeWorkDataSource() as ILocalTypeWorkDataSource}.scope(application)
        register{LocalConfigDataSource() as ILocalConfigDataSource}.scope(application)
        register{LocalTypePhotoDataSource() as ILocalTypePhotoDataSource}.scope(application)
        register{LocalCityDataSource() as ILocalCityDataSource}.scope(application)
        register{LocalWorkStatusDataSource() as ILocalWorkStatusDataSource}.scope(application)
        register{LocalAssociationDataSource() as ILocalAssociationDataSource}.scope(application)
        register{LocalPublicWorkDataSource() as ILocalPublicWorkDataSource}.scope(application)
        register{LocalCollectDataSource() as ILocalCollectDataSource}.scope(application)
        
        // RemoteDataSources
        register{RemoteConfigDataSource() as IRemoteConfigDataSource}.scope(application)
        
        // Services
        register{LocationManager()}.scope(application)
    }
}
