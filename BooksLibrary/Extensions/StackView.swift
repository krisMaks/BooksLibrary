//
//  StackView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit

extension UIStackView {
    convenience init(views: [UIView],
                     axis: NSLayoutConstraint.Axis,
                     spacing: CGFloat) {
        self.init(arrangedSubviews: views)
        self.axis = axis
        self.spacing = spacing
    }
}
