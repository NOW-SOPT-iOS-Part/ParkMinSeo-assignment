//
//  AppTabBarController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 6/6/24.
//

import UIKit

/// App의 하단 TabBarController 입니다.
final class AppTabBarController: UITabBarController {
    
    // MARK: ViewControllers
    private let homeViewController = UINavigationController(rootViewController: UIViewController())
    private let tab2ViewController = UINavigationController(rootViewController: UIViewController())
    private let tab3ViewController = UINavigationController(rootViewController: UIViewController())
    private let tab4ViewController = UINavigationController(rootViewController: UIViewController())
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
        setUpStyle()
    }
    
    // MARK: setUpView
    private func setUpView() {
    
        let viewControllerList = [
            homeViewController,
            tab2ViewController,
            tab3ViewController,
            tab4ViewController
        ]
        
        viewControllerList.enumerated().forEach { index, viewController in
            let tab = AppTab.allCases[index]
            viewController.tabBarItem = UITabBarItem(title: tab.title, image: tab.image, tag: index)
        }
        
        self.setViewControllers(viewControllerList, animated: true)
    }
    
    // MARK: setUpStyle
    private func setUpStyle() {
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .black
        self.tabBar.backgroundColor = .black
    }
}
