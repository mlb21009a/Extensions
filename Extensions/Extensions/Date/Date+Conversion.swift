//
//  Date+Conversion.swift
//  Extensions
//
//  Created by R on 2019/02/11.
//  Copyright © 2019 マック太郎. All rights reserved.
//

import Foundation

extension Date {

    /// 日時を文字列に変換
    ///
    /// - Parameter format: フォーマット
    /// - Returns: 文字列
    func toString(format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }

}

extension String {

    /// 文字列をDateに変換
    ///
    /// - Returns: Date
    func toDate() -> Date? {
        let formatter = DateFormatter()
        var dateFormat = self
        let formats = ["YYYY", "MM", "dd", "hh", "mm", "ss", "Z"]
        let array = self.components(separatedBy: NSCharacterSet.decimalDigits.inverted).filter { !$0.isEmpty }[0..<formats.count-1]

        array.enumerated().forEach { (offset, element) in
            dateFormat.replaceSubrange(dateFormat.range(of: element)!, with: formats[offset])
        }

        // +00:00の部分をZにする
        if let range = dateFormat.range(of: "[+][0-9]{2}:[0-9]{2}", options: .regularExpression, range: nil, locale: .current) {
            dateFormat.replaceSubrange(range, with: formats.last!)
        }

        formatter.dateFormat = dateFormat

        return formatter.date(from: self)
    }

}
