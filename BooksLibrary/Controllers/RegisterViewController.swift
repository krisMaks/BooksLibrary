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
        view.backgroundColor = .white
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
            Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorAuthAlert(with: e.localizedDescription)
                } else {
                    self.db.collection("users").addDocument(data: ["name" : name,
                                                                   "surname": surname,
                                                                   "middleName": middleName,
                                                                   "email": email,
                                                                   "userType": userType]) { error in
                        if let e = error {
                            self.errorAuthAlert(with: e.localizedDescription)
                        } else {
                            self.succesAuthAlert()
                        }
                    }
                }
            }
        }
        registerView.registerButton.addAction(createUser, for: .touchUpInside)
    }

}
