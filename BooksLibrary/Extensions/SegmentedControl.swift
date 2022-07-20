//
//  SegmentedControl.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 20.07.2022.
//

import UIKit

extension UISegmentedControl {
    convenience init(_ firstSegmentTitle: String, _ secondSegmentTitle: String) {
        self.init(frame: CGRect())
        self.insertSegment(withTitle: firstSegmentTitle, at: 0, animated: true)
        self.insertSegment(withTitle: secondSegmentTitle, at: 1, animated: true)
        self.selectedSegmentTintColor = UIColor(named: "textFieldBackground")
        self.setTitleTextAttributes([.foregroundColor : UIColor(named: "textColor"), .font: FontsLibrary.textField], for: .normal)
    }
}
