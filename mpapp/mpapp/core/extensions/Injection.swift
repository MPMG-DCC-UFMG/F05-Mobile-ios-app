import Foundation
import Resolver

extension Resolver:ResolverRegistering{
    public static func registerAllServices() {
        
        // ViewModels
        register{SplashViewModel()}
        register{LoginViewModel(userRepository: resolve())}
        register{CreateUserViewModel(userRepository: resolve())}
        register{ConfigurationViewModel()}
        register{SyncViewModel(publicWorkRepository: resolve())}
        register{HomeViewModel(publicWorkRepository: resolve())}
        register{LocationViewModel()}
        register{PublicWorkAddViewModel(publicWorkRepository: resolve(), typeWorkRespository: resolve())}
        register{PublicWorkViewModel(publicWorkRepository: resolve(), typeWorkRepository: resolve())}
        register{CollectViewModel(collectRepository: resolve(), publicWorkRepository: resolve(),typeWorkRepository: resolve(),workStatusRepository: resolve())}
        
        
        
        
        register{TypeWorkViewModel(typeWorkRepository: resolve())}.scope(cached)
        register{WorkStatusViewModel(typeWorkRepository: resolve(),workStatusRepository: resolve())}.scope(cached)
        register{TypePhotoViewModel(typePhotoRepository: resolve())}.scope(cached)
        register{PhotoViewModel()}.scope(cached)
        
        // Delegates
        register{FacebookDelegate(resolve())}.scope(cached)
        register{TwitterDelegate(resolve())}.scope(cached)
        register{GoogleDelegate(resolve())}.scope(cached)
        
        // Repositories
        register{TypeWorkRepository(localTypeWorkDataSource: resolve())}.scope(application)
        register{ConfigRepository(localConfigDataSource: resolve(), remoteConfigDataSource: resolve())}.scope(application)
        register{TypePhotoRepository(localTypePhotoDataSource: resolve()) }.scope(application)
        register{CityRepository(localCityDataSource: resolve())}.scope(application)
        register{WorkStatusRepository(localWorkStatusDataSource: resolve())}.scope(application)
        register{AssociationRepository(localAssociationDataSource: resolve())}.scope(application)
        register{PublicWorkRepository(localPublicWorkDataSource: resolve(), remotePublicWorkDataSource: resolve())}.scope(application)
        register{CollectRepository(localCollectDataSource:resolve(),remoteCollectDataSource: resolve(),remotePhotoDataSource: resolve())}.scope(application)
        register{UserRepository(remoteUserDataSource:resolve())}.scope(application)
        
        // LocalDataSources
        register{LocalTypeWorkDataSource()}.scope(application)
        register{LocalConfigDataSource() }.scope(application)
        register{LocalTypePhotoDataSource()}.scope(application)
        register{LocalCityDataSource()}.scope(application)
        register{LocalWorkStatusDataSource()}.scope(application)
        register{LocalAssociationDataSource()}.scope(application)
        register{LocalPublicWorkDataSource()}.scope(application)
        register{LocalCollectDataSource()}.scope(application)
        
        // RemoteDataSources
        register{RemoteConfigDataSource()}.scope(application)
        register{RemoteUserDataSource()}.scope(application)
        register{RemotePublicWorkDataSource()}.scope(application)
        register{RemotePhotoDataSource()}.scope(application)
        register{RemoteCollectDataSource()}.scope(application)
        
        // Services
        register{LocationManager()}.scope(application)
        register{NavController()}.scope(application)
    }
}
