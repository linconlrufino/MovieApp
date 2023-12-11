//
//  HomeView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 19/11/23.
//

import UIKit
import SwiftUI
import Kingfisher

public class HomeView: UIView {

    // MARK: - Constants
        
    private enum Sections {
        case nowShowing
        case popular
    }
    
    // MARK: - nowShowingMovies Mock Data

    private let nowShowingMovies = [
        Card(
            title: "Spiderman: No Way Home",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/ba1f/bf81/09fe7e6d95c0a08f44a32090b2ce4427?Expires=1702252800&Signature=OKOnDaegnTa8NDuTNosCeXTAJVfC5SBgULHVr6-emDUgtQOa~pONzhiAOPzqsXkd63Ka2jKKPQSMVJLTCnPsAsZ6mRgHVaPsGhlL01CuqJ803h7VylKbCAY1vQ21mbunmxn0HAfRWT0n3X2~hvsECx3QeJHRxZJvYXOZVWj5D7Tnh3juWbIQQn23SjUSdaK~vmnJ3lAdpGB4obJt4U5upUwQT~v2mKenQjrC8TYef-4PekS6a0GYW3e-uRw~4j4YV9onbEgXhfm9HGdUDQgW84FGnctGLUXbesNMRbtQeAqsADTVpBbst6bmBbScypUl0-lgesJ8MvZ-K2NOs~d~NA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.1
        ),
        Card(
            title: "Eternals",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/558c/7e30/1333a603c13c99258f8fae503839a571?Expires=1702252800&Signature=HWDjowTJUgX8lUDPgoYsCoFKliVhXkDvXqgQYsNRyID8-W6JsCCPnd9T96VcYYsnLnYj~DbIcsNmKM-Pe04t~tLD71sAkvPMqT9kFXLcreNhBwzAJfDONbVlLcC3Kg~s7S5tFgyMBV-ddvpnrEYAKHHkrml0zF64faW8HmGEzsNgzgLKZCsl~uvPEl8ihT-YNq5kM~iTIvz27KKYxpiW2GSwzfRplBlwGDtWGfm-oU5rsHtgUGVzGN-nnY77fRDvVMe4sPyKCdAkl0dZmzdpHCdE5yyOs8x1g1t~tFeWnNkg2VJwcTFcxaD2DA6IgKSdWAC2aeIwAPkYM7OaWK2BHw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.5
        ),
        Card(
            title: "Shang-Chi",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/57c6/0ac6/4103ab5b1873bd5c48c06727c7edc165?Expires=1702252800&Signature=Kjv-Y1c8-v5UNUS9JDPP2QlTU-qVgGB-aCpFA~zaazWGkoOA62Uyv0avmi5NEwM-feMDnCDvUVbq897-2U9huU8jMFCAigALH-IWLhBX7NS0nggzcSO~Y6l-gw3zceDKG8wVGXMLK2K9Bld7TXZ2RHG-rtr~bp~B9tDuRuD-EKn2ZgQN6bGV4VAy~i3BAkGGv5t9mY6q9eyMMMQtvm79fKl0pEg~M1CmgOJomb-894QtlERFBxynMzme9epF15OWnDFz8Cl6hpgGAofBontSffBRHY0rFBmmIG05a1dl4Ei5hGON8QmGwDkAywT3BP7phbJfpyQG~ujJSUYQVMNiQg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 8.1
        )
    ]
    
    // MARK: - popularMovies Mock Data

    private let popularMovies = [
        Card(
            title: "Venom Let There Be Carnage",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/ff89/93bd/e32b303e2de87909627e5980bf1ff020?Expires=1702252800&Signature=BPORwBI4gw1bkuTLHKntximvmKXijDlRY7rW-GlgQH6nBThRaiXkodSKQVuJAx7SJ0hb~p07lHvP1yi-cneYswHyUM7XFfC7lKBLAzTEDSUgHmmwmQFLB0zcGfeM19qiEiEMTJBj246THLgY10tsIZzGKIIczRNawqhCHkbwoJ9i4IuvMJsUV7vXl1HNc2PyrPM8tNBACzXda1-qQpFL05~R87ku~T-vGO2GmFh4S7QSTdcIfNapn~mQkzv7uq8XeyRiexCnefhYgNLmj3H62o17hRmhvIHfGRU2qFsCOWjsSpPjbJ39OA9WEKatcKPnjZUpGUrcL8uIQz93HWcF0Q__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 6.4
        ),
        Card(
            title: "The King’s Man",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/f848/dcc4/567771b490a0a92a3d50be405c35d796?Expires=1702252800&Signature=DzTxyT1CA6GvVw-9s3rYvTVtcEJbfsp2LABq2jqU3BLxO52tIWgWor-Rc4t35EXPXwDssuiJW7iD-B-ZyRL0VfZf0ncZMuthxpHnjeZWLj1333O-dXUc1WGtU3gQwGsOs4tofFkv4v7lF7wGfbj7LPArMRHLUVMBzTKDz4WIro-FJXjZoxXIT07yKGfKplLV3O53xIURCxx4Qde9F3Om-0eC6kna~qQECL~uG9wSjtuAHdmCy4KKt3chIHqTwAOOEb0oPBGrKcLX4go-xPl4mMjRe11tKQNhjLe45LnE3XTyGTS0vi3u-0kCOwNeAubgcDVkUDt1dge5EFYyu3mtVQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 8.4
        ),
        Card(
            title: "Eternals",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/558c/7e30/1333a603c13c99258f8fae503839a571?Expires=1702252800&Signature=HWDjowTJUgX8lUDPgoYsCoFKliVhXkDvXqgQYsNRyID8-W6JsCCPnd9T96VcYYsnLnYj~DbIcsNmKM-Pe04t~tLD71sAkvPMqT9kFXLcreNhBwzAJfDONbVlLcC3Kg~s7S5tFgyMBV-ddvpnrEYAKHHkrml0zF64faW8HmGEzsNgzgLKZCsl~uvPEl8ihT-YNq5kM~iTIvz27KKYxpiW2GSwzfRplBlwGDtWGfm-oU5rsHtgUGVzGN-nnY77fRDvVMe4sPyKCdAkl0dZmzdpHCdE5yyOs8x1g1t~tFeWnNkg2VJwcTFcxaD2DA6IgKSdWAC2aeIwAPkYM7OaWK2BHw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.5
        ),
        Card(
            title: "Spiderman: No Way Home",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/ba1f/bf81/09fe7e6d95c0a08f44a32090b2ce4427?Expires=1702252800&Signature=OKOnDaegnTa8NDuTNosCeXTAJVfC5SBgULHVr6-emDUgtQOa~pONzhiAOPzqsXkd63Ka2jKKPQSMVJLTCnPsAsZ6mRgHVaPsGhlL01CuqJ803h7VylKbCAY1vQ21mbunmxn0HAfRWT0n3X2~hvsECx3QeJHRxZJvYXOZVWj5D7Tnh3juWbIQQn23SjUSdaK~vmnJ3lAdpGB4obJt4U5upUwQT~v2mKenQjrC8TYef-4PekS6a0GYW3e-uRw~4j4YV9onbEgXhfm9HGdUDQgW84FGnctGLUXbesNMRbtQeAqsADTVpBbst6bmBbScypUl0-lgesJ8MvZ-K2NOs~d~NA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.1
        )
    ]
    
    private let sections: [Sections] = [.nowShowing, .popular]
    
    // MARK: - Layout Properties
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        collection.backgroundColor = .white 
        collection.dataSource = self
        collection.delegate = self
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    // MARK: - Create Compositional Layout
    
    private func createCompositionalLayout () -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (sectionIndex, env) -> NSCollectionLayoutSection? in
            switch self.sections[sectionIndex] {
            case .nowShowing:
                let size = NSCollectionLayoutSize(
                    widthDimension: .absolute(175),
                    heightDimension: .absolute(320)
                )
                let item = NSCollectionLayoutItem(layoutSize: size)
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: size, subitems: [item])
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(50)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    
                    alignment: .topLeading
                )
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .continuous
                section.boundarySupplementaryItems = [header]
                section.interGroupSpacing = 8
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 16,
                    trailing: 16
                )

                return section
                
            case .popular:
                let size = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(150))
                let item = NSCollectionLayoutItem(layoutSize: size)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
                let headerSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(50)
                )
                let header = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: headerSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                let section = NSCollectionLayoutSection(group: group)
                section.boundarySupplementaryItems = [header]
                section.interGroupSpacing = 16
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
                return section
            }
        }
    }
    
    // MARK: - Initializer
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Codable
    
    private func setupView () {
        addSubview(collectionView)
        buildViewConstraints()
        collectionView.register(NowShowingCardViewCell.self, forCellWithReuseIdentifier: NowShowingCardViewCell.identifier)
        collectionView.register(PopularCardViewCell.self, forCellWithReuseIdentifier: PopularCardViewCell.identifier)
        collectionView.register(
            SeeMoreHeaderView.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: SeeMoreHeaderView.identifier
        )
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}

// MARK: - DataSource

extension HomeView: UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection sectionIndex: Int) -> Int {
        switch sections[sectionIndex] {
            case .nowShowing:
                return 3
            case .popular:
                return 4
        }
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .nowShowing:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: NowShowingCardViewCell.identifier,
                for: indexPath
            ) as! NowShowingCardViewCell
            cell.configure(
                title: nowShowingMovies[indexPath.item].title,
                url: nowShowingMovies[indexPath.item].url,
                ratingValue: nowShowingMovies[indexPath.item].rating
            )
            return cell
        case .popular:
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: PopularCardViewCell.identifier,
                for: indexPath
            ) as! PopularCardViewCell
            cell.configure(
                title: popularMovies[indexPath.item].title,
                url: popularMovies[indexPath.item].url,
                ratingValue: popularMovies[indexPath.item].rating
            )
            return cell
        }
        
    }
    
    public func collectionView(
        _ collectionView: UICollectionView,
        viewForSupplementaryElementOfKind kind: String,
        at indexPath: IndexPath
    ) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: SeeMoreHeaderView.identifier,
            for: indexPath
        )
        
        guard let typedHeaderView = headerView as? SeeMoreHeaderView
        else { return headerView }
        
        switch sections[indexPath.section] {
        case .nowShowing:
            typedHeaderView.configure(title: "Now Showing")
        case .popular:
            typedHeaderView.configure(title: "Popular")
        }
        
        return typedHeaderView
    }
}

// MARK: - Delegate

extension HomeView: UICollectionViewDelegate {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
}

// MARK: - Preview
struct HomeView_Previews: PreviewProvider {
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
    }
}

