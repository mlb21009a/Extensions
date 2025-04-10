//
//  StackViewBuider.swift
//  Extensions
//
//  Created by R on 2025/04/10.
//  Copyright © 2025 マック太郎. All rights reserved.
//

import UIKit

/*
 こんな感じで使う想定
 stackView.views {
     view1
     view2
     view3
 }
 */
@resultBuilder struct StackViewBuider {
    static func buildBlock(_ components: UIView...) -> [UIView] {
        components.compactMap { $0 }
    }
}

extension UIStackView {
    func views(@StackViewBuider _ views: () -> [UIView]) {
        for view in views() {
            self.addArrangedSubview(view)
        }
    }
}
