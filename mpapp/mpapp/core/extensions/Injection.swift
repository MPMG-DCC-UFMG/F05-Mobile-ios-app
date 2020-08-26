import Foundation
import Resolver

extension Resolver:ResolverRegistering{
    public static func registerAllServices() {
        register{TypeWorkViewModel(typeWorkRepository: resolve())}
        
        // Repositories
        register{TypeWorkRepository(localTypeWorkDataSource: resolve()) as ITypeWorkRepository}
        register{ConfigRepository(localConfigDataSource: resolve(), remoteConfigDataSource: resolve()) as IConfigRepository}
        register{TypePhotoRepository(localTypePhotoDataSource: resolve()) as ITypePhotoRepository}
        register{CityRepository(localCityDataSource: resolve()) as ICityRepository}
        register{WorkStatusRepository(localWorkStatusDataSource: resolve()) as IWorkStatusRepository}
        register{AssociationRepository(localAssociationDataSource: resolve()) as IAssociationRepository}
        register{PublicWorkRepository(localPublicWorkDataSource: resolve()) as IPublicWorkRepository}
        
        // LocalDataSources
        register{LocalTypeWorkDataSource() as ILocalTypeWorkDataSource}
        register{LocalConfigDataSource() as ILocalConfigDataSource}
        register{LocalTypePhotoDataSource() as ILocalTypePhotoDataSource}
        register{LocalCityDataSource() as ILocalCityDataSource}
        register{LocalWorkStatusDataSource() as ILocalWorkStatusDataSource}
        register{LocalAssociationDataSource() as ILocalAssociationDataSource}
        register{LocalPublicWorkDataSource() as ILocalPublicWorkDataSource}
        
        // RemoteDataSources
        register{RemoteConfigDataSource() as IRemoteConfigDataSource}
    }
}
