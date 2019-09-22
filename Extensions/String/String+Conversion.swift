//
//  String+Conversion.swift
//  Extensions
//
//  Created by R on 2019/09/22.
//  Copyright © 2019 マック太郎. All rights reserved.
//

import Foundation

extension Int {

    // 通貨表記変換
    func convertCurrency(locale: Locale = .current) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = locale
        return formatter.string(from: NSNumber(value: self))!
    }

}
