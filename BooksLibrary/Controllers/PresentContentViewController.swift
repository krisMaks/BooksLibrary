//
//  PresentContentViewController.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.07.2022.
//

import UIKit

class PresentContentViewController: UIViewController {

    var welcomeString: String
    var startButtonIsHiddden: Bool?
    let presentView = PresentContentView()
    let welcomeImage = UIImage(named: "book")
    
    init(_ welcomeString: String, _ startButtonIsHiddden: Bool = true) {
        self.welcomeString = welcomeString
        self.startButtonIsHiddden = startButtonIsHiddden
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view = presentView
        presentView.welcomingLabel.text = welcomeString
        presentView.welcomingImage.image = welcomeImage
        presentView.startButton.isHidden = startButtonIsHiddden!
        addActionStartButton()
    }
    
    
    func addActionStartButton() {
        let action = UIAction { _ in
            
            let tb = TabBarController()
            self.navigationController?.pushViewController(tb, animated: true)
            self.dismiss(animated: true)
        }
        presentView.startButton.addAction(action, for: .touchUpInside)
    }
    
}
