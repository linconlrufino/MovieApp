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
            url: URL( string:"https://s3-alpha-sig.figma.com/img/ba1f/bf81/09fe7e6d95c0a08f44a32090b2ce4427?Expires=1703462400&Signature=DaIgcuc8JkCBvi~iG6PP~~7OJaxrg7NywAB8fFkLXHhsDj8yO4nNCj4A-wiTC46V7U-UWuDVQ2ijbMHMQllQ5j7IXofmP4Z94utbwIFcpuWND6phBSHrnHpdUZKpMlrQPk5nXCeOkjDE0cf0oLPJs-OslsqPA78V-6tbR1QtnAfsV3uZ8ICBXqaoMtgrFY38MR0qc-aP5aVMTv32lrRrUyIILDNF6qvnzwHu7Lfhe1gkrXtzREa4T8N28oAHP-z8axf8LkBIKOgg0XMnIOL4fTVrZU68f7Iaeswkv-80zIDNHWm0xAfFGhFzUtVfLZIQVYeHFSsQC~O2gDhMHgJtVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.1,
            genre: ["Action", "Adventure", "Fantasy"]
        ),
        Card(
            title: "Eternals",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/558c/7e30/1333a603c13c99258f8fae503839a571?Expires=1703462400&Signature=LZgHsrrm~wlMleiu0qgSBJEcA9jb3Fid3ukikWKqMGk4k0kOUUHaSfPSO3SHorU3xwNlt46l3KjLGKBNC8njSi4k92aZ296Wp7mYjuX9wpcaA2J14YM8R3R3FeUTjMRjaF~Q7RUa2UcCDQUrXWPYHxEW-ueXn8~mJLvKtNXsC0KBsv3o5uxMPCcq0EPa70ndZbTWcqGXueW5XvTfhmpPvEpbe8NocRPrWf7ZXF2St--bfpWnXwYBmSA15ItLAtaQN-HnaxmefxOxA3a5MLwIePHuBr0zdbVpyXVv6vsTRmkLytsXDSl8eQm5585E684eu9k8sxtqPrBEP2~uavsJeA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.5,
            genre: ["hero", "Fantasy", "Action"]
        ),
        Card(
            title: "Shang-Chi",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/57c6/0ac6/4103ab5b1873bd5c48c06727c7edc165?Expires=1703462400&Signature=XuALkWYldzPHsdskxcMhQY~n3su2n8xzgqRnRTWFEq7pPVPhz9DEK7Yg1kgX~eOkhYYA9I3LUG-iUbjpoHJ2aKFGrO0-zM1VtO~PQiVooPo68MMUnOzfgisx4Mhf1rHBi5Acn-Jn9yZqrgAJFn~FzEtH4zKJHy8BRV3xufY8fCb8vuNKUFNMMZZ98Iht~mcDh77y-quQKwKPeIV6OOYMr9QJRFIBh93eDCevSyjohOgQzzxXpHj~jApSUYLHIG8v33R~M8wngNRZHMWM9zo75KNzfJMKbTqpq86O2E2kpKZ9Uvzqhzi8DHwKLkfmfFJnKrwUXMyKNcUreWTuATD1fg__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 8.1,
            genre: ["hero", "Fantasy", "Action"]
        )
    ]
    
    // MARK: - popularMovies Mock Data

    private let popularMovies = [
        Card(
            title: "Venom Let There Be Carnage",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/ff89/93bd/e32b303e2de87909627e5980bf1ff020?Expires=1703462400&Signature=inD2rICwhE2JUBYWgaQ9As7APH2QIzQ1sHgGGupOHMsISHRz9v2Cmg6cxsNP6YHqlCsWa4EF336PixW7c7d1BKeXR-sI6E~DeSk07hhELneuh7zJQbldwcpwGPsxbZagkBWKLtMpefIYk60AyRrRK9ehNiGxWmT5sTQdRLLFXAy3sz3DEAH3hdW6AFMaPtFCDZzJL-l0BeEL29UBwNlJV1SoGzFZJqlEXc212Upr58Do~3PJsxbKe-v9vlafnsMhjWW9ck86BO34Lrq1Lm75Vj0MXAvdzfN9PwQg3EHAp3hWdMBFz~iq3hjYjLYZoDsHBI2EUfkKyv4vICxl~Dqc4g__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 6.4,
            genre: ["Horror", "Mystery", "Thriller"]
        ),
        Card(
            title: "The King’s Man",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/f848/dcc4/567771b490a0a92a3d50be405c35d796?Expires=1703462400&Signature=Dt6KkX5n5vwTiusLAqreTb~2asDrv3e~bKPkTpF4jDbv5CsC0esmJUW0tHOfDpe2t05p66hw2FKv94ZNEK-FCdO8mKJFBFpL8qba3nEc1UduHUlhpbzUaAqpkocxai6Z-Rgvw9gf67STJmEu~SoPcpcYR3u-aiLateZoad42WbimlfeLFRWcNSWoLkB54zQkHuHA8ZzLwJQv1dc7EBuRmSo7iZtCs7VC0eGMOpCu-YMe2M-7FeyytStTFCc1JXc9e9qQyUyk4shOaoyj57e~cPkg3uzEtaWyBXCB6ul1D6B5g~5zCzC95Y0HijpDBDXbGPERiJ~j7BTQ5p1lh8KanQ__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 8.4,
            genre: ["Action", "Fantasy"]
        ),
        Card(
            title: "Eternals",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/558c/7e30/1333a603c13c99258f8fae503839a571?Expires=1703462400&Signature=LZgHsrrm~wlMleiu0qgSBJEcA9jb3Fid3ukikWKqMGk4k0kOUUHaSfPSO3SHorU3xwNlt46l3KjLGKBNC8njSi4k92aZ296Wp7mYjuX9wpcaA2J14YM8R3R3FeUTjMRjaF~Q7RUa2UcCDQUrXWPYHxEW-ueXn8~mJLvKtNXsC0KBsv3o5uxMPCcq0EPa70ndZbTWcqGXueW5XvTfhmpPvEpbe8NocRPrWf7ZXF2St--bfpWnXwYBmSA15ItLAtaQN-HnaxmefxOxA3a5MLwIePHuBr0zdbVpyXVv6vsTRmkLytsXDSl8eQm5585E684eu9k8sxtqPrBEP2~uavsJeA__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.5,
            genre: ["Hero","Action", "Fantasy"]
        ),
        Card(
            title: "Spiderman: No Way Home",
            url: URL( string:"https://s3-alpha-sig.figma.com/img/ba1f/bf81/09fe7e6d95c0a08f44a32090b2ce4427?Expires=1703462400&Signature=DaIgcuc8JkCBvi~iG6PP~~7OJaxrg7NywAB8fFkLXHhsDj8yO4nNCj4A-wiTC46V7U-UWuDVQ2ijbMHMQllQ5j7IXofmP4Z94utbwIFcpuWND6phBSHrnHpdUZKpMlrQPk5nXCeOkjDE0cf0oLPJs-OslsqPA78V-6tbR1QtnAfsV3uZ8ICBXqaoMtgrFY38MR0qc-aP5aVMTv32lrRrUyIILDNF6qvnzwHu7Lfhe1gkrXtzREa4T8N28oAHP-z8axf8LkBIKOgg0XMnIOL4fTVrZU68f7Iaeswkv-80zIDNHWm0xAfFGhFzUtVfLZIQVYeHFSsQC~O2gDhMHgJtVw__&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4"
                )!,
            rating: 9.1,
            genre: ["Action", "Adventure", "Fantasy"]
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
                    widthDimension: .absolute(143),
                    heightDimension: .absolute(265)
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
                    heightDimension: .absolute(120))
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
                ratingValue: popularMovies[indexPath.item].rating,
                genresCard: popularMovies[indexPath.item].genre
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

