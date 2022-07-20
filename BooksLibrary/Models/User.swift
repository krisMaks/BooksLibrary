//
//  User.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 08.07.2022.
//

import Foundation

struct User {
    var id: String
    var lastName: String
    var name: String
    var middleName: String
    var userType: String
    var email: String
    var password: String

    var representation: [String: Any] {
        var repres = [String: Any]()
        repres["id"] = id
        repres["lastName"] = lastName
        repres["name"] = name
        repres["middleName"] = middleName
        repres["userType"] = userType
        repres["email"] = email
        repres["password"] = password
        
        return repres
    }
    
    
}
