//
//  UIView+Xib.swift
//  Extensions
//
//  Created by R on 2018/11/04.
//  Copyright © 2018 マック太郎. All rights reserved.
//

import UIKit

protocol XibIdentifiable where Self:UIView {
    /// 対応したxibファイルをviewを返す
    ///
    /// - Returns: view
    static func instantiate() -> Self
}

extension XibIdentifiable  {
    static func instantiate() -> Self {
        let name = String(describing: self)
        let nib = UINib(nibName: name, bundle: nil)
        let view = nib.instantiate(withOwner: nil, options: nil).first as! Self
        return view
    }
}
