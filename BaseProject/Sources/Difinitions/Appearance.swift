//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

class Appearance {
    
    class func fix() {
        fixNavigation()
    }
    
    private class func fixNavigation() {
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        UINavigationBar.appearance().tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        UINavigationBar.appearance().titleTextAttributes = [
            .foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0),
            .font: UIFont.title
        ]
    }
}
