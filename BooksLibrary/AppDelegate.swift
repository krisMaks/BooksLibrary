//
//  AppDelegate.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 06.03.2022.
//

import UIKit
import Firebase

var books: [Book] = []
var popularBooks: [Book] = [Book(id: 0, title: "Hello", typeDesc: "H", author: "jj", authorFullName: "jbj", ageLimitDesc: 7, genre: "bbhbh"), Book(id: 0, title: "Hello", typeDesc: "H", author: "jj", authorFullName: "jbj", ageLimitDesc: 7, genre: "bbhbh"), Book(id: 0, title: "Hello", typeDesc: "H", author: "jj", authorFullName: "jbj", ageLimitDesc: 7, genre: "bbhbh"), Book(id: 0, title: "Hello", typeDesc: "H", author: "jj", authorFullName: "jbj", ageLimitDesc: 7, genre: "bbhbh"), Book(id: 0, title: "Hello", typeDesc: "H", author: "jj", authorFullName: "jbj", ageLimitDesc: 7, genre: "bbhbh")]

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        let db = Firestore.firestore()
        getBooksData()
        return true
    }
    
    func getBooksData() {
        let db = Firestore.firestore()
        db.collection("allBooks").addSnapshotListener { querySnapshot, error in
            var book: [Book] = []
            if let e = error {
                print(e)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for document in snapshotDocuments {
                        let data = document.data()
                        if let id = data["id"] as? Int,
                           let title = data["title"] as? String,
                           let author = data["author"] as? String,
                           let authorFull = data["authorFullName"] as? String,
                           let ageLimit = data["ageLimit"] as? Int,
                           let genre = data["genre"] as? String,
                           let type = data["type"] as? String {
                            let books = Book(id: id, title: title, typeDesc: type, author: author, authorFullName: authorFull, ageLimitDesc: ageLimit, genre: genre)
                            book.append(books)
                        }
                    }
                }
                books = book
            }
        }
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

