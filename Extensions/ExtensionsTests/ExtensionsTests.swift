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

    func testDateExtension() {

        let testDate = Date(timeIntervalSince1970: 0)

        XCTAssertEqual(testDate.toString(format: "YYYY年MM月dd日HH時mm分ss秒"), "1970年01月01日09時00分00秒")

        /*
         APIによって日時のフォーマットが違うとかふざけた仕様でも多分大丈夫と思う
         ってか統一してくれるのが一番いいんだけどね。
         若干の皮肉にを込めて作りました
         */
        let testStr = "1970-01-01T00:00:00+00:00"
        XCTAssertEqual(testStr.toDate(), testDate)

        let testStr2 = "1970-01-01-00:00:00"
        XCTAssertEqual(testStr2.toDate(), Date(timeIntervalSince1970: -60*60*9))

        let testStr３ = "1970月01月01日00:00:00"
        XCTAssertEqual(testStr３.toDate(), Date(timeIntervalSince1970: -60*60*9))

        let testStr4 = "1970月1月1日0:0:0"
        XCTAssertEqual(testStr4.toDate(), Date(timeIntervalSince1970: -60*60*9))

        let testStr5 = "1970/1/1/0:0:0"
        XCTAssertEqual(testStr5.toDate(), Date(timeIntervalSince1970: -60*60*9))

        
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
