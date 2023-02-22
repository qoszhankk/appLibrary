//
//  MainTabBarController.swift
//  LibraryApp
//
//  Created by Kamshat Koszhanova on 03.12.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        generateTabBar()
    }
    
    private func generateTabBar() {
        viewControllers = [
            generateVC(
                viewController: HomeViewController(),
                title: "Home",
                image: UIImage(systemName: "house.fill")
            ),
            generateVC(
                viewController: DetailBookViewController(),
                title: "Details",
                image: UIImage(systemName: "slider.horizontal.3")
            ),
            generateVC(
                viewController: ProfileViewController(),
                title: "Profile",
                image: UIImage(systemName: "person.fill")
            )
        ]
    }
    
    private func generateVC(viewController: UIViewController, title: String, image: UIImage?) -> UIViewController {
        viewController.tabBarItem.title = title
        viewController.tabBarItem.image = image
        return viewController
    }
    
    private func setTabBarAppearance() {
        
    }
    
   
}
