//
//  NowShowingCardView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 02/12/23.
//

import UIKit
import Kingfisher
import SwiftUI

class NowShowingCardViewCell: UICollectionViewCell {
    
    static let identifier = "nowShowingCardId"
    
    // MARK: - Layout Properties

    private lazy var titleCard: UILabel = {
        titleCard = UILabel()
        titleCard.text = "Title"
        titleCard.textColor = .black
        titleCard.numberOfLines = 0
        titleCard.font = .systemFont(ofSize: 14, weight: .bold)
        titleCard.translatesAutoresizingMaskIntoConstraints = false
        return titleCard
    }()
  
    private lazy var image: UIImageView = {
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 10
        return image
    }()
    
    private lazy var rating: RatingView = {
        rating = RatingView()
        rating.translatesAutoresizingMaskIntoConstraints = false
        return rating
    }()
    
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
        
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),
            image.leadingAnchor.constraint(equalTo: leadingAnchor),
            image.trailingAnchor.constraint(equalTo: trailingAnchor),
            image.heightAnchor.constraint(equalToConstant: 212),

            titleCard.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            titleCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleCard.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            rating.topAnchor.constraint(equalTo: titleCard.bottomAnchor, constant: 12),
            rating.leadingAnchor.constraint(equalTo: leadingAnchor),
        ])
    }
    
    public func configure(title: String, url: URL, ratingValue: Double) {
        titleCard.text = title
        image.kf.setImage(with:url)
        rating.configure(rating: ratingValue)
    }
}
