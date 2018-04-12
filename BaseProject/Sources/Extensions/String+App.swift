//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

extension String {
    
    static let empty = ""
    
    func substring(position: Int, length: Int) -> String {
        let st = index(startIndex, offsetBy: position)
        let ed = index(startIndex, offsetBy: position + (length - 1))
        if st > ed {
            return .empty
        }
        let sub = self[st...ed]
        return String(sub)
    }
}
