//
//  UIViewController+Storyboard.swift
//  Extensions
//
//  Created by R on 2018/11/04.
//  Copyright © 2018 マック太郎. All rights reserved.
//

import UIKit

protocol StoryboardIdentifiable {
    /// 対応したstoryboradのUIViewcontrollerを返す
    ///
    /// - Returns: UIViewcontroller
    static func instantiate() -> Self
}

extension StoryboardIdentifiable where Self:UIViewController {
    static func instantiate() -> Self {
        let name = String(describing: self)
        let storyboard = UIStoryboard(name: name, bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! Self
        return vc
    }
}
