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
    static func convertData(_ instance:Self) -> Data? {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        encoder.keyEncodingStrategy = .convertToSnakeCase
        return try? encoder.encode(instance)
    }
}

extension Decodable {
    
    /// 自型に変換
    ///
    /// - Parameter data: Data
    /// - Returns: 自型
    static func convertSelf(_ data:Data) -> Self? {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted({
            let f = DateFormatter()
            f.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
            return f
            }())
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        let instance = try? decoder.decode(Self.self, from: data)
        return instance
    }
}
