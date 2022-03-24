//
//  StartView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit
import PinLayout


class StartView: UIView {

    let emailTF = UITextField(placeholder: "Mailbox name")
    let passwordTF = UITextField(placeholder: "Password")
    let loginButton = UIButton(text: "Log In", font: FontsLibrary.button)
    let registerButton = UIButton(text: "Register", font: FontsLibrary.button)
    let imageLogo = UIImageView(image: UIImage(named: "BOOKS"))

    init() {
        super.init(frame: CGRect())
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let views = [imageLogo, emailTF, passwordTF, loginButton, registerButton]
        for view in views {
            addSubview(view)
            view.translatesAutoresizingMaskIntoConstraints = false
        }
        imageLogo.pin.topCenter(pin.safeArea.top + 10).width(50%).aspectRatio()
        emailTF.pin.below(of: imageLogo, aligned: .center).marginTop(20).width(300).height(44)
        passwordTF.pin.below(of: emailTF, aligned: .center).marginTop(20).width(300).height(44)
        loginButton.pin.below(of: passwordTF, aligned: .center).marginTop(20).width(300).height(44)
        registerButton.pin.below(of: loginButton, aligned: .center).marginTop(20).width(300).height(44)
    }
    
   
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
