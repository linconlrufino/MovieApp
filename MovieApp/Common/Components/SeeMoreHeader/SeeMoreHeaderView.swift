//
//  SeeMoreView.swift
//  MovieApp
//
//  Created by Linconl Rufino on 26/11/23.
//

import UIKit
import SwiftUI

class SeeMoreHeaderView: UICollectionReusableView {

    static let identifier = "seeMoreId"
    
    // MARK: - Layout Properties

    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Title - See More"
        label.textColor = .CardsTitleColor
        label.font = UIFont(name: "Merriweather-Black", size: 16)

        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeMoreButton: SeeMoreButton = {
        let button = SeeMoreButton()
        button.setTitle("See more", for: .normal)
        button.setTitleColor(.SeeMoreButtonColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    // MARK: - Initializer
    
    override init(frame: CGRect){
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    // MARK: - View Codable

    private func layout() {
      [label, seeMoreButton].forEach {
        addSubview($0)
      }
        buildViewConstraints()
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: topAnchor),
            label.leadingAnchor.constraint(equalTo: leadingAnchor),
            label.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            seeMoreButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            seeMoreButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            seeMoreButton.heightAnchor.constraint(equalToConstant: 21),
            seeMoreButton.widthAnchor.constraint(equalToConstant: 61)
        ])
    }
    
    public func configure(title: String) {
      label.text = title
    }
}

// MARK: - Preview
struct ContentViews_Previews: PreviewProvider {
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

