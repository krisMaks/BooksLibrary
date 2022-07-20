//
//  DatabaseService.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.07.2022.
//

import Foundation
import FirebaseFirestore

class DatabaseService {
    static let shared = DatabaseService()
    let db = Firestore.firestore()
    var userRef: CollectionReference { db.collection("users") }
    
    private init() {}
    
    func setUser(user: User,
                 completion: @escaping (Result<User, Error>) -> ()) {
        userRef.document(user.id).setData(user.representation) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(user))
            }
        }
    }
}
