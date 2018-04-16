//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import UIKit

extension String {
    
    static let empty = ""
    
    func substring(location: Int, length: Int) -> String {
        if location < 0 || count <= location || length <= 0 {
            return .empty
        }
        
        let maxlen = count - location
        let len = (length <= maxlen ? length : maxlen) - 1
        
        let start = index(startIndex, offsetBy: location)
        let end = index(startIndex, offsetBy: location + len)
        if start > end {
            return .empty
        }
        let sub = self[start...end]
        return String(sub)
    }
    
    func substring(start location: Int) -> String {
        return substring(location: location, length: count - location)
    }
    
    func substring(end location: Int) -> String {
        return substring(location: 0, length: location + 1)
    }
    
    func substring(range: NSRange) -> String {
        return substring(location: range.location, length: range.length)
    }
}
