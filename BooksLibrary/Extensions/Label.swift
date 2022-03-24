//
//  Label.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit

extension UILabel {
    
    convenience init(text: String,
                     font: UIFont) {
        self.init(frame: CGRect())
        self.text = text
        self.font = font
    }
}
