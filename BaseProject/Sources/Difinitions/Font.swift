//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

extension UIFont {
    
    static let title = textBoldFont(size: 18)
    
    class func textFont(size: CGFloat) -> UIFont {
        return UIFont(name: "ArialMT", size: size)!
    }
    
    class func textBoldFont(size: CGFloat) -> UIFont {
        return UIFont(name: "Arial-BoldMT", size: size)!
    }
}
