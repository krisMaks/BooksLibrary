//
//  TabBarController.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let booksVC = BooksViewController()
        viewControllers = [generateNavVC(rootVC: booksVC, title: "Books", image: UIImage(systemName: "books.vertical")!)]
        
    }
    
    private func generateNavVC(rootVC: UIViewController,
                               title: String,
                               image: UIImage) -> UIViewController {
        let navVC = UINavigationController(rootViewController: rootVC)
        navVC.tabBarItem.title = title
        navVC.tabBarItem.image = image
        
        return navVC
    }
    

}
