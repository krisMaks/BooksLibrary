//
//  RegisterViewController.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.03.2022.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    let registerView = RegisterView()
    let db = Firestore.firestore()
    override func viewDidLoad() {
        super.viewDidLoad()
        view = registerView
        view.backgroundColor = UIColor(named: "background")
        navigationController?.navigationBar.tintColor = UIColor(named: "textColor")
        addActions()
    }

    func addActions() {
        let createUser = UIAction { _ in
            guard let email = self.registerView.emailTF.text,
                  let password = self.registerView.passwordTF.text,
                  let name = self.registerView.nameTF.text,
                  let surname = self.registerView.surnameTF.text,
                  let middleName = self.registerView.middleNameTF.text,
                  let userType = self.registerView.segmentControl.titleForSegment(at: self.registerView.segmentControl.selectedSegmentIndex) else { return }
            AuthService.shared.signUp(lastName: surname,
                                      name: name,
                                      middleName: middleName,
                                      userType: userType,
                                      email: email,
                                      password: password) { dbResult in
                
                switch dbResult{
                case .success(let user):
                    self.succesAuthAlert(with: user.email!)
                case .failure(let error):
                    self.errorAuthAlert(with: error.localizedDescription)
                }
            }
        }
        registerView.registerButton.addAction(createUser, for: .touchUpInside)
    }

}
