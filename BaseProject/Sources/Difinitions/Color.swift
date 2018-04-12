//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

extension UIColor {
    
    static let caption = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
    static let body = #colorLiteral(red: 0.3019607843, green: 0.3098039216, blue: 0.3019607843, alpha: 1)
    
    struct button {
        
        struct normal {
            static let background = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            static let foreground = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9843137255, alpha: 1)
        }
        struct highlighted {
            static let background = #colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)
            static let foreground = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9843137255, alpha: 1)
        }
        struct disabled {
            static let background = #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1)
            static let foreground = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        }
    }
}
