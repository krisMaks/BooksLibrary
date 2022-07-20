//
//  StartView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit
import PinLayout


class StartView: UIView {

    private struct Metrix {
        static let widthTextField: CGFloat = 300
        static let heightTextField: CGFloat = 44
        static let maxWidthImage: CGFloat = 400
        static let widthButton: CGFloat = 150
        static let marginTop: CGFloat = 20
    }
    
    let emailTF = UITextField(placeholder: "Mailbox name")
    let passwordTF = UITextField(placeholder: "Password")
    let loginButton = UIButton(text: "Log In", font: FontsLibrary.button)
    let registerButton = UIButton(text: "Register", font: FontsLibrary.button)
    let imageLogo = UIImageView(image: UIImage(named: "book"))

    init() {
        super.init(frame: CGRect())
        emailTF.textContentType = .emailAddress
        passwordTF.isSecureTextEntry = true
        let views = [imageLogo, emailTF, passwordTF, loginButton, registerButton]
        for view in views {
            if let tf = view as? UITextField {
                tf.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
                tf.leftViewMode = .always
                addSubview(tf)
            } else {
                addSubview(view)
            }
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        layoutFields()
    }
    
    private func layoutFields() {
        imageLogo.pin
            .top(pin.safeArea)
            .hCenter()
            .width(50%)
            .maxWidth(Metrix.maxWidthImage)
            .aspectRatio()
        emailTF.pin
            .below(of: imageLogo)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        passwordTF.pin
            .below(of: emailTF)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthTextField)
            .height(Metrix.heightTextField)
        loginButton.pin
            .below(of: passwordTF)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthButton)
            .height(Metrix.heightTextField)
        registerButton.pin
            .below(of: loginButton)
            .hCenter()
            .marginTop(Metrix.marginTop)
            .width(Metrix.widthButton)
            .height(Metrix.heightTextField)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
