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
    
    func encode<T>(_ value: T) throws -> [URLQueryItem] where T : Encodable {
        return []
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

private class URLQueryItemEncoderKeyedContainer<Key: CodingKey>: KeyedEncodingContainerProtocol {
    
    var codingPath: [CodingKey]
    
    func encodeNil(forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Bool, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: String, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Double, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Float, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Int, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Int8, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Int16, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Int32, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: Int64, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: UInt, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: UInt8, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: UInt16, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: UInt32, forKey key: Key) throws {
        <#code#>
    }
    
    func encode(_ value: UInt64, forKey key: Key) throws {
        <#code#>
    }
    
    func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        <#code#>
    }
    
    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        <#code#>
    }
    
    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        <#code#>
    }
    
    func superEncoder() -> Encoder {
        <#code#>
    }
    
    func superEncoder(forKey key: Key) -> Encoder {
        <#code#>
    }
}
