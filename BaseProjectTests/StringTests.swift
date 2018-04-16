//
//  Copyright (C) Nakayasu Yuichi All rights reserved.
//
import XCTest
@testable import BaseProject

class StringTests: XCTestCase {
    
    // substring(location:length:)
    // =========================================================================
    func test_substring_location_lengthの正常系テスト() {
        let ret = "ABCDEFG".substring(location: 2, length: 3)
        XCTAssert(ret == "CDE", "\"ABCDEFG\".substring(location: 2, length: 3)が \"CDE\"を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数lengthが0の場合() {
        let ret = "ABCDEFG".substring(location: 2, length: 0)
        XCTAssert(ret == "", "\"ABCDEFG\".substring(location: 2, length: 0)が 空文字を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数locationが0の場合() {
        let ret = "ABCDEFG".substring(location: 0, length: 3)
        XCTAssert(ret == "ABC", "\"ABCDEFG\".substring(location: 0, length: 3)が \"ABC\"を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数lengthが負の整数の場合() {
        let ret = "ABCDEFG".substring(location: 2, length: -1)
        XCTAssert(ret == "", "\"ABCDEFG\".substring(location: 2, length: -1)が 空文字を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数locationが負の整数の場合() {
        let ret = "ABCDEFG".substring(location: -1, length: 3)
        XCTAssert(ret == "", "\"ABCDEFG\".substring(location: -1, length: 3)が 空文字を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数lengthの限界値前テスト() {
        let ret = "ABCDEFG".substring(location: 2, length: 5)
        XCTAssert(ret == "CDEFG", "\"ABCDEFG\".substring(location: 2, length: 5)が \"CDEFG\"を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数lengthの限界値超テスト() {
        let ret = "ABCDEFG".substring(location: 2, length: 6)
        XCTAssert(ret == "CDEFG", "\"ABCDEFG\".substring(location: 2, length: 6)が \"CDEFG\"を返すこと")
    }

    func test_substring_location_length_メソッドの引数locationの限界値前テスト() {
        let ret = "ABCDEFG".substring(location: 6, length: 1)
        XCTAssert(ret == "G", "\"ABCDEFG\".substring(location: 6, length: 1)が \"G\"を返すこと")
    }
    
    func test_substring_location_length_メソッドの引数locationの限界値超テスト() {
        let ret = "ABCDEFG".substring(location: 7, length: 1)
        XCTAssert(ret == "", "\"ABCDEFG\".substring(location: 7, length: 1)が 空文字を返すこと")
    }
    
    func test_substring_location_length_メソッドのゼロ値テスト() {
        let ret = "ABCDEFG".substring(location: 0, length: 0)
        XCTAssert(ret == "", "\"ABCDEFG\".substring(location: 0, length: 0)が 空文字を返すこと")
    }
    
    // substring(start:) / substring(end:)
    // =========================================================================
    func test_substring_startの正常系テスト() {
        let ret = "ABCDEFG".substring(start: 4)
        XCTAssert(ret == "EFG", "\"ABCDEFG\".substring(start: 4)が \"EFG\"を返すこと")
    }
    
    func test_substring_endの正常系テスト() {
        let ret = "ABCDEFG".substring(end: 4)
        XCTAssert(ret == "ABCDE", "\"ABCDEFG\".substring(end: 4)が \"ABCDE\"を返すこと")
    }
}
