import Foundation
import SwiftUI

class FontProvider{
    static var gothamBold =  "Gotham-Bold"
    
    static var gothamRoundedMedium = "GothamRounded-Medium"
    
    static var gothamRoundedBook = "GothamRounded-Book"
    
    static func getAvailableFontNames(){
        for family: String in UIFont.familyNames
        {
            print(family)
            for names: String in UIFont.fontNames(forFamilyName: family)
            {
                print("== \(names)")
            }
        }
    }
}
