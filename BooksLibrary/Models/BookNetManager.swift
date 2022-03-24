//
//  BookNetManager.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 09.03.2022.
//

import Foundation

protocol BookManagerDelegate {
    func didUpdateBooks(_ books: [Book])
}

struct BookNetManager {
    private let url = "https://api.npoint.io/f5093822511ab8b7365d"
    var delegate: BookManagerDelegate?
    func performRequest() {
        guard let url = Bundle.main.url(forResource: "file", withExtension: "json") else { return }
        
        do {
            let data = try Data(contentsOf: url)
            guard let books = parseJSON(data) else { return }
            delegate?.didUpdateBooks(books)
        } catch {
            print(error)
        }
    }
    
    func parseJSON(_ data: Data) -> [Book]? {
        do {
            let library = try JSONDecoder().decode(Library.self, from: data)
            return library.items.map { $0.book }
        } catch {
            print(error)
            return nil
        }
    }
}
