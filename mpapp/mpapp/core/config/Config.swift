import Foundation

public enum Config {
    // MARK: - Keys
    enum Keys {
        enum Plist {
            static let baseURL = "BASE_URL"
            static let trenaKey = "TRENA_KEY"
            static let sentryDNS = "SENTRY_DNS"
            static let environment = "ENVIRONMENT"
            static let googleAPIKey = "GOOGLE_API_KEY"
            static let twitterAPIKey = "TWITTER_API_KEY"
            static let twitterAPISecret = "TWITTER_API_SECRET"
        }
    }
    
    // MARK: - Plist
    private static let infoDictionary: [String: Any] = {
        guard let dict = Bundle.main.infoDictionary else {
            fatalError("Plist file not found")
        }
        return dict
    }()
    
    // MARK: - Plist values
    static let baseURL: URL = {
        guard let baseURLstring = Config.infoDictionary[Keys.Plist.baseURL] as? String else {
            fatalError("Root URL not set in plist for this environment")
        }
        guard let url = URL(string: baseURLstring) else {
            fatalError("Root URL is invalid")
        }
        return url
    }()
    
    static let trenaKey: String = {
        guard let trenaKey = Config.infoDictionary[Keys.Plist.trenaKey] as? String else {
            fatalError("API Key not set in plist for this environment")
        }
        return trenaKey
    }()
    
    static let sentryDNS: String = {
        guard let sentryDNS = Config.infoDictionary[Keys.Plist.sentryDNS] as? String else {
            fatalError("Sentry DNS not set in plist for this environment")
        }
        return sentryDNS
    }()
    
    static let environment: String = {
        guard let environment = Config.infoDictionary[Keys.Plist.environment] as? String else {
            fatalError("Environment not set in plist for this environment")
        }
        return environment
    }()
    
    static let googleAPIKey: String = {
        guard let googleAPIKey = Config.infoDictionary[Keys.Plist.googleAPIKey] as? String else {
            fatalError("GoogleAPI Key not set in plist for this environment")
        }
        return googleAPIKey
    }()
    
    static let twitterAPIKey: String = {
        guard let twitterAPIKey = Config.infoDictionary[Keys.Plist.twitterAPIKey] as? String else {
            fatalError("Twitter API Key not set in plist for this environment")
        }
        return twitterAPIKey
    }()
    
    static let twitterAPISecret: String = {
        guard let twitterAPISecret = Config.infoDictionary[Keys.Plist.twitterAPISecret] as? String else {
            fatalError("Twitter API Secret not set in plist for this environment")
        }
        return twitterAPISecret
    }()
}
