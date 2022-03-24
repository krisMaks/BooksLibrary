//
//  Button.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit

extension UIButton {
    
    convenience init(text: String,
                     font: UIFont) {
        self.init(type: .system)
        self.setTitle(text, for: .normal)
        self.titleLabel?.font = font
        self.layer.cornerRadius = 12
    }
}
