import UIKit
import Resolver
import Sentry
import GoogleMaps
import FBSDKCoreKit
import Firebase
import GoogleSignIn

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        setupSentry()
        setupGoogle()
        setupFirebase()
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        return true
    }
    
    func application(_ application: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any])
      -> Bool {
      return GIDSignIn.sharedInstance().handle(url) && ApplicationDelegate.shared.application(application, open: url, options: options)
    }
    
    private func setupSentry() {
        SentrySDK.start { options in
            options.dsn = Config.sentryDNS
            options.environment = Config.environment
            options.debug = (Config.environment == "development")
        }
    }
    
    private func setupGoogle(){
        GMSServices.provideAPIKey(Config.googleAPIKey)
    }
    
    private func setupFirebase(){
        FirebaseApp.configure()
        GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
    }
    
}

