//
//  ExtensionsTests.swift
//  ExtensionsTests
//
//  Created by R on 2018/11/04.
//  Copyright © 2018 マック太郎. All rights reserved.
//

import XCTest
@testable import Extensions

class ExtensionsTests: XCTestCase {

    struct Hoge: Codable {
        let name: String
        let age: Int
        let birthday: Date
    }

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCodableExtension() {
        let test = Hoge(name: "Hoge太郎", age: 100, birthday: Date(timeIntervalSince1970: 0))

        /*
         Data型に変換
         あんま使う機会ないけど独自クラスをUserDefaultに保存する時とかでも使える
         */
        let data = Hoge.convertData(test)
        /*
         Data型から指定のクラスへ変換
         APIのレスポンスのパースに使う時に便利かも
        */
        let hoge = Hoge.convertSelf(data)

        XCTAssertEqual(hoge.name, "Hoge太郎")
        XCTAssertEqual(hoge.age, 100)
        XCTAssertEqual(hoge.birthday, Date(timeIntervalSince1970: 0))



    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
