# F05-Mobile-ios-app
Project of mobile iOS client for TRENA project using SwiftUI and CocoaPods

# Third Party Libraries

* [Realm](https://realm.io/): MongoDB Realm helps you build modern mobile apps, faster
* [RxRealm](https://github.com/RxSwiftCommunity/RxRealm): This library is a thin wrapper around RealmSwift
* [Resolver](https://github.com/hmlongco/Resolver): An ultralight Dependency Injection / Service Locator framework for Swift 5.1 on iOS.
* [Alamofire](https://github.com/Alamofire/Alamofire): Alamofire is an HTTP networking library written in Swift.
* [PromiseKit](https://github.com/mxcl/PromiseKit): PromiseKit is a thoughtful and complete implementation of promises for any platform that has a swiftc.

# Environment

To define environments in this project were used two files **Development.xcconfig** for development variables and 
**Production.xcconfig** for production.

Both files should be defined similar as:

```bash
#include "Pods/Target Support Files/Pods-mpapp/Pods-mpapp.debug.xcconfig"

BASE_URL = http:/$()/0.0.0.0:8000/
SENTRY_DNS = <SENTRY_DNS>
ENVIRONMENT = development
TRENA_KEY = <TRENA_KEY>
GOOGLE_API_KEY = <GOOGLE_API_KEY>
```

## Sponsors

<h1 align="center">
  <a href="https://www.mpmg.mp.br/">
      <img src="./assets/mmpg_logo.png" alt="MPMG">
  </a>
  <br>
  <a href="https://sentry.io/">
      <img src="./assets/sentry-logo-black.png" alt="Sentry">
  </a>
  <br>
</h1>
