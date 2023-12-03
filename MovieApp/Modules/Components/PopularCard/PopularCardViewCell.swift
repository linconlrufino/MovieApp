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
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleCard.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 20),
            titleCard.topAnchor.constraint(equalTo: topAnchor),
            titleCard.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    public func configure(title: String, url: URL) {
        titleCard.text = title
        let processor = DownsamplingImageProcessor(size: CGSizeMake(80, 150)) |> RoundCornerImageProcessor(cornerRadius: 10)
        
        image.kf.setImage(with:url, options: [.processor(processor)])
    }
}
