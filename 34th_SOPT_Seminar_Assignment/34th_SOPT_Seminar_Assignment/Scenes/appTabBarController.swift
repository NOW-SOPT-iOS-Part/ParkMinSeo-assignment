//
//  appTabBarController.swift
//  34th_SOPT_Seminar_Assignment
//
//  Created by 박민서 on 4/29/24.
//

import UIKit

final class appTabBarController: UITabBarController {
    
    // MARK: Life Cycle - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let tabOne = UINavigationController(rootViewController: homeViewController())
        tabOne.tabBarItem = UITabBarItem(
            title: "홈",
            image: UIImage.icHome,
            tag: 0)
        
        let tabTwo = UINavigationController(rootViewController: LoginViewController())
        tabTwo.tabBarItem = UITabBarItem(
            title: "공개예정",
            image: UIImage.icWatch,
            tag: 1)
        
        let tabThree = UINavigationController(rootViewController: WelcomeViewController())
        tabThree.tabBarItem = UITabBarItem(
            title: "검색",
            image: UIImage.icSearch,
            tag: 2)
        
        let tabFour = UINavigationController(rootViewController: LoginViewController())
        tabFour.tabBarItem = UITabBarItem(
            title: "기록",
            image: UIImage.icHistory,
            tag: 3)
        
        self.viewControllers = [tabOne, tabTwo, tabThree, tabFour]
        
        setUpView()
    }
    
    // MARK: setUpView
    private func setUpView() {
        self.tabBar.tintColor = .white
        self.tabBar.barTintColor = .black
        self.tabBar.backgroundColor = .black
    }
}

// MARK: add if needed
//extension appTabBarController: UITabBarControllerDelegate {
//}
