//
//  UITextView+HTML.swift
//  Extensions
//
//  Created by R on 2022/12/01.
//  Copyright © 2022 マック太郎. All rights reserved.
//

import UIKit

extension UITextView {

    // 文字がテキストにおさまっているか判定
    func isShowfullText() -> Bool {
        let range = NSRange(location: self.text.count - 1, length: 1)
        let rect = self.layoutManager.boundingRect(forGlyphRange: range, in: self.textContainer)
        return (rect != .zero)
    }

    // テキストが選択された場合に、コピーなどのメニューを出さないようにする
    //    override func becomeFirstResponder() -> Bool {
    //        false
    //    }

    /// HTMLコードをviewに適応
    /// - Parameters:
    ///   - code: HTMLコード
    ///   - font: フォント
    ///   - color: カラー
    func setHTMLCode(code: String, font: UIFont, color: UIColor) {
        // HTML読み込む場合はデフォルト赤になる
        self.linkTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.blue]
        self.isEditable = false
        // 参考: https://qiita.com/a_jike/items/7cae4654d9b8a08ceeea
        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey: Any] = [
            NSAttributedString.DocumentReadingOptionKey.documentType: NSAttributedString
                .DocumentType.html,
            NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8
                .rawValue,
        ]

        if
            let htmlData = code.data(using: .utf8),
            let attributedText = try? NSAttributedString(
                data: htmlData,
                options: attributedOptions,
                documentAttributes: nil
            )
        {
            let fullRange = NSRange(location: 0, length: attributedText.length)
            let mutableAttributedText = NSMutableAttributedString(attributedString: attributedText)
            let font = font
            let color = color
            mutableAttributedText.enumerateAttribute(
                .font,
                in: fullRange,
                options: .longestEffectiveRangeNotRequired,
                using: { _, range, _ in
                    mutableAttributedText.addAttribute(.font, value: font, range: range)
                }
            )

            mutableAttributedText.enumerateAttribute(
                .foregroundColor,
                in: fullRange,
                options: .longestEffectiveRangeNotRequired,
                using: { attribute, range, _ in
                    if attribute is UIColor {
                        mutableAttributedText.addAttribute(
                            .foregroundColor,
                            value: color,
                            range: range
                        )
                    }
                }
            )

            self.attributedText = mutableAttributedText
        }
    }
}
