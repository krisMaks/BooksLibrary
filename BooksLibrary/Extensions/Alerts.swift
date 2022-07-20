//
//  Alerts.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.03.2022.
//

import Foundation
import UIKit

extension RegisterViewController {
    
    func errorAuthAlert(with text: String) {
        let alert = UIAlertController(title: "Registration error", message: text, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
    
    func succesAuthAlert(with email: String) {
        let alert = UIAlertController(title: "Authorization with \(email) complete", message: nil, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel) { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }
}

extension StartViewController {
    func errorAuthAlert(with text: String) {
        let alert = UIAlertController(title: "Authorization error", message: text, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .cancel)
        alert.addAction(cancelAction)
        present(alert, animated: true)
    }

}
