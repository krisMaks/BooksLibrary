//
//  RegisterView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.03.2022.
//

import UIKit
import PinLayout


class RegisterView: UIView {

    private struct Metrix {
        static let widthTextField: CGFloat = 300
        static let heightTextField: CGFloat = 44
        static let widthButton: CGFloat = 150
        static let marginTop: CGFloat = 10
    }
    
    let nameTF = UITextField(placeholder: "Your name")
    let surnameTF = UITextField(placeholder: "Your last name")
    let middleNameTF = UITextField(placeholder: "Your middle name")
    let segmentControl = UISegmentedControl(UserType.Reader.rawValue, UserType.Librarian.rawValue)
    let imageLogo = UIImageView(image: UIImage(named: "book"))
    let registerLabel = UILabel(text: "User registration:", font: FontsLibrary.label, alignment: .center)
    let registerButton = UIButton(text: "Register", font: FontsLibrary.button)
    let emailTF = UITextField(placeholder: "Mailbox name")
    let passwordTF = UITextField(placeholder: "Password")
    
    init() {
        super.init(frame: CGRect())
        passwordTF.isSecureTextEntry = true
        segmentControl.selectedSegmentIndex = 0
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        let views = [imageLogo, registerLabel, nameTF, surnameTF, middleNameTF, segmentControl, emailTF, passwordTF, registerButton]
        for view in views {
            if let tf = view as? UITextField {
                tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
                tf.leftViewMode = .always
                addSubview(tf)
            } else {
                addSubview(view)
            }
        }
        imageLogo.pin
            .hCenter()
            .top(pin.safeArea.top + Metrix.marginTop)
            .width(40%)
            .aspectRatio()
        registerLabel.pin
            .below(of: imageLogo)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        surnameTF.pin
            .below(of: registerLabel)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        nameTF.pin
            .below(of: surnameTF)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        middleNameTF.pin
            .below(of: nameTF)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        segmentControl.pin
            .below(of: middleNameTF)
            .hCenter()
            .marginTop(20)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        emailTF.pin
            .below(of: segmentControl)
            .hCenter()
            .marginTop(20)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        passwordTF.pin
            .below(of: emailTF)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        registerButton.pin
            .below(of: passwordTF)
            .hCenter()
            .marginTop(20)
            .width(Metrix.widthButton)
            .height(Metrix.heightTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
