//
//  ViewController.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit
import Firebase

class StartViewController: UIViewController {

    let startView = StartView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = startView
        view.backgroundColor = .white
        addActions()
    }

    func addActions() {
        let registerAction = UIAction { _ in
            let vc = RegisterViewController()
            self.navigationController?.pushViewController(vc, animated: true)
        }
        startView.registerButton.addAction(registerAction, for: .touchUpInside)
        
        let loginUser = UIAction { _ in
            guard let email = self.startView.emailTF.text,
                  let password = self.startView.passwordTF.text else { return }
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorAuthAlert(with: e.localizedDescription)
                } else {
                    let tb = TabBarController()
                    self.navigationController?.pushViewController(tb, animated: true)
                }
            }
        }
        startView.loginButton.addAction(loginUser, for: .touchUpInside)
    }

    
    
}

