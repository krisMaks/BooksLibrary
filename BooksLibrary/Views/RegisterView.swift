//
//  RegisterView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.03.2022.
//

import UIKit
import PinLayout


class RegisterView: UIView {

    let nameTF = UITextField(placeholder: "Your name")
    let surnameTF = UITextField(placeholder: "Your last name")
    let middleNameTF = UITextField(placeholder: "Your middle name")
    let segmentControl = UISegmentedControl()
    let imageLogo = UIImageView(image: UIImage(named: "BOOKS"))
    let registerLabel = UILabel(text: "User registration:", font: FontsLibrary.label)
    let registerButton = UIButton(text: "Register", font: FontsLibrary.button)
    let emailTF = UITextField(placeholder: "Mailbox name")
    let passwordTF = UITextField(placeholder: "Password")
    
    init() {
        super.init(frame: CGRect())
        setViews()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        let views = [imageLogo, registerLabel, nameTF, surnameTF, middleNameTF, segmentControl, emailTF, passwordTF, registerButton]
        for view in views {
            addSubview(view)
        }
        imageLogo.pin.topCenter(pin.safeArea.top + 10).width(40%).aspectRatio()
        registerLabel.pin.topCenter(to: imageLogo.anchor.bottomCenter).marginTop(10).sizeToFit()
        surnameTF.pin.topCenter(to: registerLabel.anchor.bottomCenter).marginTop(20).width(300).height(30)
        nameTF.pin.topCenter(to: surnameTF.anchor.bottomCenter).marginTop(10).width(300).height(30)
        middleNameTF.pin.topCenter(to: nameTF.anchor.bottomCenter).marginTop(10).width(300).height(30)
        segmentControl.pin.topCenter(to: middleNameTF.anchor.bottomCenter).marginTop(10).width(300).height(30)
        emailTF.pin.topCenter(to: segmentControl.anchor.bottomCenter).marginTop(10).width(300).height(30)
        passwordTF.pin.topCenter(to: emailTF.anchor.bottomCenter).marginTop(10).width(300).height(30)
        registerButton.pin.topCenter(to: passwordTF.anchor.bottomCenter).marginTop(20).sizeToFit()
    }
    
    func setViews() {
        segmentControl.insertSegment(withTitle: "Reader", at: 0, animated: true)
        segmentControl.insertSegment(withTitle: "Librarian", at: 1, animated: true)
        segmentControl.selectedSegmentIndex = 0
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
