//
//  BooksViewController.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 09.03.2022.
//

import UIKit
import Firebase

class BooksViewController: UIViewController {

    let booksView = BooksView()
    let db = Firestore.firestore()
    var networkManager = BookNetManager()
    let plus = UIBarButtonItem(image: UIImage(systemName: "line.horizontal.3.decrease.circle"), style: .plain, target: nil, action: nil)
    
//    var books: [Book] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        view = booksView
        view.backgroundColor = .white
        booksView.collectionView.delegate = self
        booksView.collectionView.dataSource = self
        navigationItem.rightBarButtonItem = plus
        title = "Books"
        
    }
    

    
    
}

extension BooksViewController: UICollectionViewDelegate, UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return BooksView.sections.count
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return BooksView.sections[section].count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookCell.reuseID, for: indexPath) as! BookCell
        let section = BooksView.sections[indexPath.section]
        
        let item = section[indexPath.item]
        cell.titleLabel.text = item.title
        cell.ageLabel.text = item.author
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = booksView.collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeader.reuseID, for: indexPath) as! SectionHeader
        if indexPath.section == 0 {
            header.title.text = "Popular"
        } else {
            header.title.text = "Books"
        }
        return header
    }
    
}


    


extension BooksViewController: BookManagerDelegate {
    func didUpdateBooks(_ books: [Book]) {
        for book in books {
            db.collection("allBooks").addDocument(data: [ "id": book.id,
                                                          "title": book.title,
                                                          "type": book.typeDesc,
                                                          "author": book.author,
                                                          "authorFullName": book.authorFullName,
                                                          "genre": book.genre,
                                                          "ageLimit": book.ageLimitDesc]) { error in
                if let e = error {
                    print(e.localizedDescription)
                }
            }
        }
        
        
    }
}
