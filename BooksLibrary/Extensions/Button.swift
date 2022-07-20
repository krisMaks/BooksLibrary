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
        self.backgroundColor = UIColor(named: "buttonBackground")
        self.setTitleColor(UIColor(named: "background"), for: .normal)
        self.setTitleColor(UIColor(named: "textFieldBackground"), for: .focused)
        
        self.clipsToBounds = false
        self.layer.cornerRadius = 12
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.gray.cgColor
    }
}
