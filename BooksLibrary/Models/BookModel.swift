//
//  BookModel.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 09.03.2022.
//

import Foundation

struct Library: Codable, Hashable {
    let items: [BookItem]
    
    enum CodingKeys: String, CodingKey {
        case items = "features"
    }
}

struct BookItem: Codable, Hashable {
    let book: Book
    
    enum CodingKeys: String, CodingKey {
        case book = "properties"
    }
}

enum BookType {
    case electronic, audio, pdf, unknown
}

enum AgeLimit {
    case zero, six, twelve, sixteen, eighteen, unknown
}

struct Book: Codable, Hashable {
    var id: Int
    var title: String
    var typeDesc: String
    var author: String
    var authorFullName: String
    var ageLimitDesc: Int
    var genre: String
//    var admissionDate: String?
//    var admissionPrice: Double?
//    var numberOfProvided: Int?
//    var inventoryNumber: Double?
//    var expirationDate: String?
    
    
//    var type: BookType {
//        switch typeDesc {
//        case "Электронный текст":
//            return .electronic
//        case "Аудиокнига":
//            return .audio
//        case "PDF-книга":
//            return .pdf
//        default:
//            return .unknown
//        }
//    }
//    var ageLimit: AgeLimit {
//        switch ageLimitDesc {
//        case 0:
//            return .zero
//        case 6:
//            return .six
//        case 12:
//            return .twelve
//        case 16:
//            return .sixteen
//        case 18:
//            return .eighteen
//        default:
//            return .unknown
//        }
//    }

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Название"
        case typeDesc = "Тип"
        case author = "Автор"
        case authorFullName = "Автор (ФИО)"
        case ageLimitDesc = "Возрастное ограничение на книгу"
        case genre = "Жанр книги"
//        case admissionDate = "Дата поступления"
//        case admissionPrice = "Цена поступления"
//        case numberOfProvided = "Кол-во выдач"
//        case inventoryNumber = "Инвентарный номер"
//        case expirationDate = "Выдана до"
        
    }
}
