//
//  BooksView.swift
//  BooksLibrary
//
//  Created by Кристина Максимова on 09.03.2022.
//

import UIKit

class BooksView: UIView {

    let collectionView: UICollectionView!
    static let sections = [popularBooks, books]
    
    init() {
        collectionView = UICollectionView(frame: CGRect(), collectionViewLayout: BooksView.createLayout())
        super.init(frame: CGRect())
        collectionView.register(BookCell.self, forCellWithReuseIdentifier: BookCell.reuseID)
        collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.reuseID)
       
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        addSubview(collectionView)
        collectionView.pin.all()
    }
    
    static func createLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
            
            switch sectionIndex {
            case 0:
                return createBooksPopularSection()
            default:
                return createBooksSection()
            }
        }
        return layout
    }
    
    static func createBooksPopularSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.5))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 3)
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 12, trailing: 12)
        section.orthogonalScrollingBehavior = .continuous
        let header = createSectionHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    
    static func createBooksSection() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48),
                                              heightDimension: .fractionalHeight(1))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(0.6))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitem: item,
                                                       count: 2)
        group.interItemSpacing = .fixed(12)
        
        let section = NSCollectionLayoutSection(group: group)
        
        section.interGroupSpacing = 12
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 12, trailing: 12)
        let header = createSectionHeader()
        section.boundarySupplementaryItems = [header]
        return section
    }
    
    static func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                                heightDimension: .estimated(1))
        let header = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: headerSize,
                                                                 elementKind: UICollectionView.elementKindSectionHeader,
                                                                 alignment: .top)
        return header
        
    }
//        let layout = UICollectionViewCompositionalLayout { sectionIndex, _ in
//
//            let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.48),
//                                                  heightDimension: .fractionalHeight(1))
//            let item = NSCollectionLayoutItem(layoutSize: itemSize)
//
//            let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
//                                                   heightDimension: .fractionalWidth(0.6))
//            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
//                                                           subitem: item,
//                                                           count: 2)
//            group.interItemSpacing = .fixed(12)
//
//            let section = NSCollectionLayoutSection(group: group)
//
//
//            section.interGroupSpacing = 12
//            section.contentInsets = NSDirectionalEdgeInsets.init(top: 0, leading: 12, bottom: 12, trailing: 12)
//            return section
//        }
//        return layout
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
