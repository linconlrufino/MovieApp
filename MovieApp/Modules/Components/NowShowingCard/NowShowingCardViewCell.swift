//
//  NowShowingCardView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 02/12/23.
//

import UIKit
import Kingfisher

class NowShowingCardViewCell: UICollectionViewCell {
    
    static let identifier = "nowShowingCardId"
    
    private lazy var titleCard: UILabel = {
        titleCard = UILabel()
        titleCard.text = "Title"
        titleCard.textColor = .black
        titleCard.numberOfLines = 0
        titleCard.font = .systemFont(ofSize: 16, weight: .bold)
        titleCard.translatesAutoresizingMaskIntoConstraints = false
        return titleCard
    }()
  
    private lazy var image: UIImageView = {
        image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    private func layout() {
        addSubview(titleCard)
        addSubview(image)
        
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor),

            titleCard.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 10),
            titleCard.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleCard.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func configure(title: String, url: URL) {
        titleCard.text = title
        let processor = DownsamplingImageProcessor(size: CGSizeMake(195, 250)) |> RoundCornerImageProcessor(cornerRadius: 10)

        image.kf.setImage(with:url, options: [.processor(processor)])
    }
}
