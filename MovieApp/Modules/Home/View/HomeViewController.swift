//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Linconl Rufino on 13/11/23.
//

import SwiftUI

class HomeViewController: UIViewController {
    
    private lazy var homeView: HomeView = {
        let homeView = HomeView()
        homeView.translatesAutoresizingMaskIntoConstraints = false
        return homeView
    }()
    
    public func buildViewConstraints() {
        NSLayoutConstraint.activate([
            homeView.topAnchor.constraint(equalTo: view.topAnchor),
            homeView.leftAnchor.constraint(equalTo: view.leftAnchor),
            homeView.rightAnchor.constraint(equalTo: view.rightAnchor),
            homeView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
 
    override func loadView() {
        view = UIView()
        view.addSubview(homeView)
    }
    
    override func viewDidLoad() {        
        buildViewConstraints()
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
