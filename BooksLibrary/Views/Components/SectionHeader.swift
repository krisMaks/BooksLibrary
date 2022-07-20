//
//  SectionHeader.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 13.03.2022.
//

import UIKit

class SectionHeader: UICollectionReusableView {
    static let reuseID = "SectionHeader"
    let title = UILabel(text: "", font: FontsLibrary.label, alignment: .left)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        setConstraints()
    }
    
    private func setViews() {
        addSubview(title)
        title.translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: topAnchor),
            title.leadingAnchor.constraint(equalTo: leadingAnchor),
            title.trailingAnchor.constraint(equalTo: trailingAnchor),
            title.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
