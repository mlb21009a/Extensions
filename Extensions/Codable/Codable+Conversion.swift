//
//  Codable+Parse.swift
//  Extensions
//
//  Created by R on 2018/11/04.
//  Copyright © 2018 マック太郎. All rights reserved.
//

import Foundation

extension Data {

    /// Data型を生成
    ///
    /// - Parameter instance: インスタンス
    /// - Returns: Data
    init<T: Encodable>(_ instance: T, dateFormat: String? = nil) {
        let encoder = JSONEncoder()
        if let dateFormat = dateFormat {
            let f = DateFormatter()
            f.dateFormat = dateFormat
            encoder.dateEncodingStrategy = .formatted(f)
        } else {
            encoder.dateEncodingStrategy = .iso8601
        }
        encoder.keyEncodingStrategy = .convertToSnakeCase
        self = try! encoder.encode(instance)
    }
}

extension Decodable {

    /// Dataを元に初期化
    ///
    /// - Parameter data: Data
    init(_ data:Data, dateFormat: String? = nil) {
        let decoder = JSONDecoder()
        if let dateFormat = dateFormat {
            let f = DateFormatter()
            f.dateFormat = dateFormat
            decoder.dateDecodingStrategy = .formatted(f)
        } else {
            decoder.dateDecodingStrategy = .iso8601
        }
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        self = try! decoder.decode(Self.self, from: data)
    }
}
