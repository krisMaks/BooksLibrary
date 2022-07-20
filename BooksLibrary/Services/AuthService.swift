//
//  AuthService.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.07.2022.
//

import Foundation
import FirebaseAuth

class AuthService {
    typealias FBUser = FirebaseAuth.User
    static let shared = AuthService()
    let auth = Auth.auth()
    var currentUser: FBUser? { auth.currentUser }
    
    private init() {}
    
    func signUp(lastName: String,
                name: String,
                middleName: String,
                userType: String,
                email: String,
                password: String,
                completionHandler: @escaping (Result<FBUser, Error>) -> ()) {
        auth.createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                completionHandler(.failure(error))
            } else if let result = result {
                let user = User(id: result.user.uid,
                                lastName: lastName,
                                name: name,
                                middleName: middleName,
                                userType: userType,
                                email: email,
                                password: password)
                DatabaseService.shared.setUser(user: user) { dbResult in
                    switch dbResult {
                    case .failure(let error):
                        completionHandler(.failure(error))
                    case .success(_):
                        completionHandler(.success(result.user))
                    }
                }
            }
            
        }
    }
}
