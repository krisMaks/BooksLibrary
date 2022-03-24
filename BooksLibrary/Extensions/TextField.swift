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
        self.placeholder = placeholder
        self.clipsToBounds = true
        self.layer.cornerRadius = 12
    }
}
