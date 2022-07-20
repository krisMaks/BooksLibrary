//
//  TextField.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit

extension UITextField {
    
    convenience init(placeholder: String) {
        self.init(frame: CGRect())
        self.font = FontsLibrary.textField
        self.attributedPlaceholder = NSAttributedString(string: placeholder,
                                                        attributes: [.foregroundColor : UIColor(named: "placeholderText")])
        self.textColor = UIColor(named: "textColor")
        self.clipsToBounds = false
        self.clearButtonMode = .whileEditing
        self.backgroundColor = UIColor(named: "textFieldBackground")
        self.layer.cornerRadius = 12
        self.layer.shadowRadius = 1
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.shadowColor = UIColor.gray.cgColor
    }
}
