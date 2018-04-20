//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import Foundation

class URLQueryItemEncoder: Encoder {
    
    var codingPath = [CodingKey]()
    
    var userInfo = [CodingUserInfoKey : Any]()
    
    fileprivate var datastore = [Any]()
    
    func encode<T>(_ value: T) throws -> [URLQueryItem] where T : Encodable {
        try value.encode(to: self)
        return datastore.last as? [URLQueryItem] ?? []
    }
    
    func container<Key>(keyedBy type: Key.Type) -> KeyedEncodingContainer<Key> where Key : CodingKey {
        let container = URLQueryItemEncoderKeyedContainer<Key>(encoder: self, codingPath: codingPath)
        let encodingContainer = KeyedEncodingContainer(container)
        return encodingContainer
    }
    
    func unkeyedContainer() -> UnkeyedEncodingContainer {
        let container = URLQueryItemEncoderUnkeyedContanier(encoder: self, codingPath: codingPath)
        return container
    }
    
    func singleValueContainer() -> SingleValueEncodingContainer {
        let container = URLQueryItemEncoderUnkeyedContanier(encoder: self, codingPath: codingPath)
        return container
    }
}

private struct URLQueryItemCodingKey: CodingKey {
    
    var stringValue: String
    
    var intValue: Int?
    
    init?(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = nil
    }
    
    init?(intValue: Int) {
        self.stringValue = "\(intValue)"
        self.intValue = intValue
    }
}

private class URLQueryItemEncoderKeyedContainer<Key>: KeyedEncodingContainerProtocol where Key: CodingKey {
    
    private var encoder: URLQueryItemEncoder
    
    private(set) var codingPath: [CodingKey]
    
    init(encoder: URLQueryItemEncoder, codingPath: [CodingKey]) {
        self.encoder = encoder
        self.codingPath = codingPath
        
        encoder.datastore.append([URLQueryItem]())
    }
    
    private func store(value: Any, key: Key) {
        guard var queryItems = encoder.datastore.popLast() as? [URLQueryItem] else {
            return
        }
        
        let name = key.stringValue // snake記法に変えるならここ
        let stringValue = String(describing: value)
        let queryItem = URLQueryItem(name: name, value: stringValue)
        queryItems.append(queryItem)
        
        encoder.datastore.append(queryItems)
    }
    
    func encodeNil(forKey key: Key) throws {
        // NOP.
    }
    
    func encode(_ value: Bool, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: String, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Double, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Float, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Int, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Int8, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Int16, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Int32, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: Int64, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: UInt, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: UInt8, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: UInt16, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: UInt32, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode(_ value: UInt64, forKey key: Key) throws {
        store(value: value, key: key)
    }
    
    func encode<T>(_ value: T, forKey key: Key) throws where T : Encodable {
        codingPath.append(key)
        try value.encode(to: encoder)
        let en = encoder.datastore.popLast()!
        store(value: en, key: key)
        codingPath.removeLast()
    }
    
    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type, forKey key: Key) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        codingPath.append(key)
        let container = URLQueryItemEncoderKeyedContainer<NestedKey>(encoder: encoder, codingPath: codingPath)
        let encodingContainer = KeyedEncodingContainer(container)
        codingPath.removeLast()
        return encodingContainer
    }
    
    func nestedUnkeyedContainer(forKey key: Key) -> UnkeyedEncodingContainer {
        codingPath.append(key)
        let container = URLQueryItemEncoderUnkeyedContanier(encoder: encoder, codingPath: codingPath)
        codingPath.removeLast()
        return container
    }
    
    func superEncoder() -> Encoder {
        return encoder
    }
    
    func superEncoder(forKey key: Key) -> Encoder {
        return encoder
    }
}

private class URLQueryItemEncoderUnkeyedContanier: UnkeyedEncodingContainer, SingleValueEncodingContainer {
    
    private var encoder: URLQueryItemEncoder
    
    private(set) var codingPath: [CodingKey]
    
    var count: Int {
        guard let array = encoder.datastore.last as? [Any] else {
            return 0
        }
        return array.count
    }
    
    init(encoder: URLQueryItemEncoder, codingPath: [CodingKey]) {
        self.encoder = encoder
        self.codingPath = codingPath
        
        encoder.datastore.append([String]())
    }
    
    private func store(value: Any) {
        guard var stringValues = encoder.datastore.popLast() as? [String] else {
            return
        }
        
        let stringValue = String(describing: value)
        stringValues.append(stringValue)
        
        encoder.datastore.append(stringValues)
    }
    
    func encodeNil() throws {
        // NOP.
    }
    
    func encode(_ value: Bool) throws {
        store(value: value)
    }
    
    func encode(_ value: String) throws {
        store(value: value)
    }
    
    func encode(_ value: Double) throws {
        store(value: value)
    }
    
    func encode(_ value: Float) throws {
        store(value: value)
    }
    
    func encode(_ value: Int) throws {
        store(value: value)
    }
    
    func encode(_ value: Int8) throws {
        store(value: value)
    }
    
    func encode(_ value: Int16) throws {
        store(value: value)
    }
    
    func encode(_ value: Int32) throws {
        store(value: value)
    }
    
    func encode(_ value: Int64) throws {
        store(value: value)
    }
    
    func encode(_ value: UInt) throws {
        store(value: value)
    }
    
    func encode(_ value: UInt8) throws {
        store(value: value)
    }
    
    func encode(_ value: UInt16) throws {
        store(value: value)
    }
    
    func encode(_ value: UInt32) throws {
        store(value: value)
    }
    
    func encode(_ value: UInt64) throws {
        store(value: value)
    }
    
    func encode<T>(_ value: T) throws where T : Encodable {
        let key = URLQueryItemCodingKey(intValue: count)!
        codingPath.append(key)
        try value.encode(to: encoder)
        let en = encoder.datastore.popLast()!
        store(value: en)
        codingPath.removeLast()
    }

    func nestedContainer<NestedKey>(keyedBy keyType: NestedKey.Type) -> KeyedEncodingContainer<NestedKey> where NestedKey : CodingKey {
        let key = URLQueryItemCodingKey(intValue: count)!
        codingPath.append(key)
        let container = URLQueryItemEncoderKeyedContainer<NestedKey>(encoder: encoder, codingPath: codingPath)
        let encodingContainer = KeyedEncodingContainer(container)
        codingPath.removeLast()
        return encodingContainer
    }
    
    func nestedUnkeyedContainer() -> UnkeyedEncodingContainer {
        let key = URLQueryItemCodingKey(intValue: count)!
        codingPath.append(key)
        let container = URLQueryItemEncoderUnkeyedContanier(encoder: encoder, codingPath: codingPath)
        codingPath.removeLast()
        return container
    }
    
    func superEncoder() -> Encoder {
        return encoder
    }
}
