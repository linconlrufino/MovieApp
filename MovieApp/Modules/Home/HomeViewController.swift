//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Linconl Rufino on 13/11/23.
//

import SwiftUI

class HomeViewController: UICollectionViewController {
    
    private let reuseIdentifier = "Cell"
    private  let seeMoreId = "seeMoreId"
    private static let seeMoreHeaderId = "seeMoreHeaderId"
    
    init() {
        super.init(collectionViewLayout: HomeViewController.createLayout())
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    static func createLayout () -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(50)))
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(250)), subitems: [item])
                group.interItemSpacing = .fixed(1)
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.trailing = 16
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 36
                
                return section
            } else if sectionNumber == 1 {
                
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(320)))
                item.contentInsets.trailing = 16
                
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.85), heightDimension: .estimated(500)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.bottom = 36
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: seeMoreHeaderId, alignment: .topLeading)
                ]
                
                return section
                
            } else {
                let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.55)))
                item.contentInsets.bottom = 12
                
                let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(350)), subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                section.contentInsets.trailing = 16
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: seeMoreHeaderId, alignment: .topLeading)
                ]
                
                return section
            }
        }
    }
        
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if(section == 0){
            return 3
        } else {
            return 4
        }
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
        cell.backgroundColor = .blue
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: seeMoreId, for: indexPath)
        
        return header
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView.register(SeeMore.self, forSupplementaryViewOfKind: HomeViewController.seeMoreHeaderId, withReuseIdentifier: seeMoreId)
    }
}

class SeeMore: UICollectionReusableView {
    let label = UILabel()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        label.text = "Title - See More"
        
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}

// MARK: - Preview
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewControllerRepresentable {
        func makeUIViewController(context: Context) -> UIViewController {
            UINavigationController(
                rootViewController: HomeViewController()
            )
        }
        
        func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
        
        typealias UIViewControllerType = UIViewController
    }
}
