//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Linconl Rufino on 13/11/23.
//

import SwiftUI

class HomeViewController: UIViewController {
    
    // MARK: - Layout Properties

    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        return homeView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addView()
        buildViewConstraints()
    }
    
    // MARK: - View Codable
    
    private func addView() {
        view.addSubview(homeView)
    }
    
    private func buildViewConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            homeView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

// MARK: - Preview
struct CollectionViewController_Previews: PreviewProvider {
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
