//
//  PresentContentView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.07.2022.
//

import UIKit
import PinLayout

class PresentContentView: UIView {
    
    let welcomingLabel = UILabel(text: "", font: FontsLibrary.label, alignment: .center)
    let welcomingImage = UIImageView()
    let pageControl = UIPageControl()
    let startButton = UIButton(text: "Let's go", font: FontsLibrary.button)
    
    init() {
        super.init(frame: CGRect())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

        addSubview(welcomingLabel)
        addSubview(welcomingImage)
        addSubview(startButton)
        
        welcomingImage.pin.topCenter(pin.safeArea.top + 10).width(30%).aspectRatio()
        welcomingLabel.pin.below(of: welcomingImage, aligned: .center).width(80%).height(50)
        startButton.pin.below(of: welcomingLabel, aligned: .center).width(80%).height(50)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
