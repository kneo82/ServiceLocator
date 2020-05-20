public final class ServiceLocator {
    
    public static let shared = ServiceLocator()
    
    private init() {
    }
    
    private var services: [String: Any] = [:]
    
    public func addService<T>(_ service: T) {
        services[nameOfType(T.self)] = service
    }
    
    public func getServiceOf<T>(_ type: T.Type) -> T? {
        services[nameOfType(type.self)] as? T
    }
    
    private func nameOfType<T>(_ type: T.Type) -> String {
        String(describing: type)
    }
}
