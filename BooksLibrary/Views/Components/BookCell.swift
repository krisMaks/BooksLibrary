//
//  BookCell.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 09.03.2022.
//

import UIKit
import PinLayout

class BookCell: UICollectionViewCell {
    static let reuseID = "BookCell"
    let titleLabel = UILabel(text: "", font: FontsLibrary.labelCell, alignment: .left)
    let ageLabel = UILabel(text: "", font: FontsLibrary.labelCell, alignment: .left)
    let imageBook = UIImageView(image: UIImage(named: "book"))
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(imageBook)
        addSubview(titleLabel)
        addSubview(ageLabel)
        ageLabel.pin.bottomCenter().sizeToFit()
        titleLabel.pin.bottomCenter(to: ageLabel.anchor.topCenter).width(of: self).height(20)
        imageBook.pin.above(of: titleLabel).top().left().right()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
