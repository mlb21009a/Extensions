//
//  Codable+Parse.swift
//  Extensions
//
//  Created by R on 2018/11/04.
//  Copyright © 2018 マック太郎. All rights reserved.
//

import Foundation

extension Encodable {
    /// Data型に変換
    ///
    /// - Parameter instance: インスタンス
    /// - Returns: Data
     static func convertData(_ instance: Self, dateFormat: String? = nil) -> Data {
        let encoder = JSONEncoder()
        if let dateFormat = dateFormat {
            let f = DateFormatter()
            f.dateFormat = dateFormat
            encoder.dateEncodingStrategy = .formatted(f)
        } else {
            encoder.dateEncodingStrategy = .iso8601
        }
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try! encoder.encode(instance)
    }
}

extension Decodable {
    
    /// 自型に変換
    ///
    /// - Parameter data: Data
    /// - Returns: 自型
    static func convertSelf(_ data:Data, dateFormat: String? = nil) -> Self {
        let decoder = JSONDecoder()
        if let dateFormat = dateFormat {
            let f = DateFormatter()
            f.dateFormat = dateFormat
            decoder.dateDecodingStrategy = .formatted(f)
        } else {
            decoder.dateDecodingStrategy = .iso8601
        }
        decoder.keyDecodingStrategy = .convertFromSnakeCase

        return try! decoder.decode(Self.self, from: data)
    }
}
