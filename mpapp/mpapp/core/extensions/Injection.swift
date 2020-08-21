import Foundation
import Resolver

extension Resolver:ResolverRegistering{
    public static func registerAllServices() {
        register{TypeWorkViewModel(typeWorkRepository: resolve())}
        register{TypeWorkRepository(localTypeWorkDataSource: resolve()) as ITypeWorkRepository}
        register{LocalTypeWorkDataSource() as ILocalTypeWorkDataSource}
    }
}
