import Foundation
import Resolver

extension Resolver:ResolverRegistering{
    public static func registerAllServices() {
        register{TypeWorkViewModel(typeWorkRepository: resolve())}
        
        // Repositories
        register{TypeWorkRepository(localTypeWorkDataSource: resolve()) as ITypeWorkRepository}
        register{ConfigRepository(localConfigDataSource: resolve(), remoteConfigDataSource: resolve()) as IConfigRepository}
        
        // LocalDataSources
        register{LocalTypeWorkDataSource() as ILocalTypeWorkDataSource}
        register{LocalConfigDataSource() as ILocalConfigDataSource}
        
        // RemoteDataSources
        register{RemoteConfigDataSource() as IRemoteConfigDataSource}
    }
}
