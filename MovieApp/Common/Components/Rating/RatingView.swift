//
//  RatingStarsView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 08/12/23.
//

import UIKit
import SwiftUI

class RatingView: UIView {
    
    // MARK: - Layout Properties

    private lazy var star: UIImageView = {
        star =  UIImageView()
        let configuration = UIImage.SymbolConfiguration(pointSize: 12, weight: .medium)
        star.image = UIImage(systemName: "star.fill", withConfiguration: configuration)
        star.tintColor = .RatingStarColor
        star.translatesAutoresizingMaskIntoConstraints = false
        return star
    }()
    
    private lazy var ratingLabel: UILabel = {
        ratingLabel = UILabel()
        ratingLabel.textColor = .RatingTextColor
        ratingLabel.font = .systemFont(ofSize: 12)
        ratingLabel.translatesAutoresizingMaskIntoConstraints = false
        ratingLabel.text = "10/10 IMDb"
        return ratingLabel
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
        addSubview(star)
        addSubview(ratingLabel)
        
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            star.centerYAnchor.constraint(equalTo: centerYAnchor),
            star.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            ratingLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            ratingLabel.leadingAnchor.constraint(equalTo: star.trailingAnchor, constant: 5)
        ])
    }
    
    public func configure(rating: Double){
        ratingLabel.text = "\(rating)/10 IMDb"
    }
}

// MARK: - Preview
struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewRepresentable {
        func updateUIView(_ uiView: RatingView, context: Context) {}
        
        func makeUIView(context: Context) -> RatingView {
            return RatingView()
        }
    }
}

