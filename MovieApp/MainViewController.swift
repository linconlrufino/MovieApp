//
//  HomeViewController.swift
//  MovieApp
//
//  Created by Linconl Rufino on 18/10/23.
//

import SwiftUI

class MainViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }

    // MARK: - TabBar Setup
    private func setupTabBar() {
        tabBar.tintColor = UIColor.tabBarItemColor
        tabBar.backgroundColor = .white
        
        let homeVC = createTabBarItem("Home", "house", HomeViewController())
        let starWarsVC = createTabBarItem("Search", "magnifyingglass.circle", ViewController())
        let gridVC = createTabBarItem("Profile", "person.crop.circle", ViewController())
        
        setViewControllers([homeVC, starWarsVC, gridVC], animated: false)
    }
    
    private func createTabBarItem(_ title: String,_ image: String, _ viewController: UIViewController) -> UINavigationController {
        
        let navigation = UINavigationController(rootViewController: viewController)
        
        navigation.tabBarItem.title = title
        navigation.tabBarItem.image = UIImage(systemName: image)
        navigation.tabBarItem.selectedImage = UIImage(systemName: image + ".fill")

        navigation.viewControllers.first?.navigationItem.title = title
        
        return navigation
    }
}

// MARK: - Preview
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    
    typealias UIViewControllerType = MainViewController
    
    func makeUIViewController(context: Context) -> MainViewController {
        MainViewController()
    }
    
    func updateUIViewController(_ uiViewController: MainViewController, context: Context) {
    }
}

struct ViewController_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerRepresentable()
    }
}
