//
//  PopularCardView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 02/12/23.
//

import UIKit
import Kingfisher

class PopularCardViewCell: UICollectionViewCell {
    
    static let identifier = "popularCardId"
    
    var genres: [String] = [String]()

    // MARK: - Layout Properties
    
    private lazy var titleCard: UILabel = {
        titleCard = UILabel()
        titleCard.text = "Title"
        titleCard.textColor = .black
        titleCard.numberOfLines = 0
        titleCard.font = UIFont(name: "Mulish-Bold", size: 14)
        titleCard.translatesAutoresizingMaskIntoConstraints = false
        return titleCard
    }()
  
    private lazy var image: UIImageView = {
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var rating: RatingView = {
        rating = RatingView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()
    
    private lazy var genresList: UICollectionView = {
        let genresList = UICollectionView(frame: .zero, collectionViewLayout: createCompositionalLayout())
        genresList.backgroundColor = .white
        genresList.dataSource = self
        genresList.delegate = self
        genresList.translatesAutoresizingMaskIntoConstraints = false
        return genresList
    }()
    
    private lazy var duration: DurationView = {
        duration = DurationView()
        duration.translatesAutoresizingMaskIntoConstraints = false
        return duration
    }()
    
    private func createCompositionalLayout () -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout {
            (sectionIndex, env) -> NSCollectionLayoutSection? in
                let size = NSCollectionLayoutSize(
                    widthDimension: .absolute(61),
                    heightDimension: .absolute(18))
                let item = NSCollectionLayoutItem(layoutSize: size)
                let group = NSCollectionLayoutGroup.vertical(layoutSize: size, subitems: [item])
                let section = NSCollectionLayoutSection(group: group)
            section.orthogonalScrollingBehavior = .continuous
                section.interGroupSpacing = 8
                section.contentInsets = NSDirectionalEdgeInsets(
                    top: 0,
                    leading: 16,
                    bottom: 0,
                    trailing: 16
                )
                return section
        }
    }
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - View Codable

    private func layout() {
        addSubview(titleCard)
        addSubview(image)
        addSubview(rating)
        addSubview(genresList)
        addSubview(duration)
        
        genresList.register(GenreViewCell.self, forCellWithReuseIdentifier: GenreViewCell.identifier)
        
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            image.widthAnchor.constraint(equalToConstant: 85),
            
            titleCard.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            titleCard.topAnchor.constraint(equalTo: topAnchor),
            titleCard.widthAnchor.constraint(equalToConstant: 150),
            
            rating.topAnchor.constraint(equalTo: titleCard.bottomAnchor, constant: 16),
            rating.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            
            genresList.topAnchor.constraint(equalTo: rating.bottomAnchor, constant: 16),
            genresList.leadingAnchor.constraint(equalTo: image.trailingAnchor),
            genresList.widthAnchor.constraint(equalToConstant: 300),
            genresList.heightAnchor.constraint(equalToConstant: 18),
            
            duration.topAnchor.constraint(equalTo: genresList.bottomAnchor, constant: 16),
            duration.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20)
        ])
    }
    
    public func configure(title: String, url: URL, ratingValue: Double,genresCard: [String], durationValue: String) {
        titleCard.text = title
        rating.configure(ratingValue)
        genres = genresCard
        image.kf.setImage(with:url)
        duration.configure(durationValue)
    }
}

// MARK: - CollectionView DataSource

extension PopularCardViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GenreViewCell.identifier, for: indexPath) as! GenreViewCell
        cell.configure(genre: genres[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection sectionIndex: Int) -> Int {
        return genres.count
    }
}

// MARK: - CollectionView Delegate

extension PopularCardViewCell: UICollectionViewDelegate {
    public func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
}
