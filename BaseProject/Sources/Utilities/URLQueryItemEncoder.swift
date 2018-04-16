//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import Foundation

class URLQueryItemEncoder: Encoder {
    
    var codingPath: [CodingKey] = []
    
    var userInfo: [CodingUserInfoKey : Any] = [:]
    
    init() {
        // NOP.
    }
    
    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        <#code#>
    }
    
    func unkeyedContainer() -> UnkeyedEncodingContainer {
        <#code#>
    }
    
    func singleValueContainer() -> SingleValueEncodingContainer {
        <#code#>
    }
}
