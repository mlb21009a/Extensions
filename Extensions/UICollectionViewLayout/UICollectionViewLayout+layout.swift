//
//  UICollectionViewLayout+layout.swift
//  Extensions
//
//  Created by R on 2021/06/07.
//  Copyright © 2021 マック太郎. All rights reserved.
//

import UIKit

extension UICollectionViewLayout {


    /// セルのレイアウト
    /// - Parameters:
    ///   - space: セルとセルの間隔
    ///   - edgeInsets: セルと端の間隔
    /// - Returns: レイアウト
    func createLayout(space: CGFloat = 0, edgeInsets: NSDirectionalEdgeInsets = .zero) -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                              heightDimension: .estimated(10))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .estimated(10))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])

        let section = NSCollectionLayoutSection(group: group)

        // セルとセルの間隔
        section.interGroupSpacing = space

        // セルと端の間隔
        section.contentInsets = edgeInsets

        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
}
