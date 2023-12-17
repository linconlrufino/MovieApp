//
//  GenreView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 16/12/23.
//

import UIKit
import SwiftUI

class GenreViewCell: UICollectionViewCell {
    
    static let identifier = "genreCardId"

    // MARK: - Layout Properties

    private lazy var genreLabel : UILabel = {
        genreLabel = UILabel()
        genreLabel.text = "Genre"
        genreLabel.textColor = UIColor.GenreTextColor
        genreLabel.textAlignment = .center
        genreLabel.font = .systemFont(ofSize: 8)
        genreLabel.backgroundColor = UIColor.GenreBackgroundColor
        genreLabel.layer.masksToBounds = true
        genreLabel.layer.cornerRadius = 10
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        return genreLabel
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
    
    private func layout(){
        addSubview(genreLabel)
        
        buildViewConstraints()
    }
    
    private func buildViewConstraints(){
        NSLayoutConstraint.activate([
            genreLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            genreLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            genreLabel.widthAnchor.constraint(equalToConstant: 56),
            genreLabel.heightAnchor.constraint(equalToConstant: 18)
        ])
    }
    
    public func configure(genre: String){
        genreLabel.text = genre
    }
}

// MARK: - Preview
struct GenreView_Previews: PreviewProvider {
    static var previews: some View {
        Container().edgesIgnoringSafeArea(.all)
    }

    struct Container: UIViewRepresentable {
        func updateUIView(_ uiView: GenreViewCell, context: Context) {}
        
        func makeUIView(context: Context) -> GenreViewCell {
            return GenreViewCell()
        }
    }
}


