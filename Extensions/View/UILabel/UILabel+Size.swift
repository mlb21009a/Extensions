//
//  UILabel+Size.swift
//  Extensions
//
//  Created by R on 2026/01/26.
//  Copyright © 2026 マック太郎. All rights reserved.
//

import UIKit

extension UILabel {

    func measureHeight() -> CGFloat? {
        guard let text = self.text else { return nil }
        let str: NSString = .init(string: text)
        let measureHeight = str.boundingRect(
            with: .init(width: self.bounds.width, height: .greatestFiniteMagnitude),
            options: [.usesLineFragmentOrigin, .usesFontLeading], // 複数行対応と行間をUILabelっぽくする
            attributes: [.font: self.font!],
            context: nil).size.height

        return measureHeight + abs(self.font!.descender)
    }
}
