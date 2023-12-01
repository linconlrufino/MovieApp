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
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Title - See More"
        label.textColor = .black
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var seeMoreButton: SeeMoreButton = {
        let button = SeeMoreButton()
        button.setTitle("See More", for: .normal)
        button.setTitleColor(.SeeMoreButtonColor, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

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
            seeMoreButton.heightAnchor.constraint(equalToConstant: 25),
            seeMoreButton.widthAnchor.constraint(equalToConstant: 90)
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

