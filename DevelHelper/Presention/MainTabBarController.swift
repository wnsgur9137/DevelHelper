//
//  MainTabBarController.swift
//  DevelHelper
//
//  Created by 이준혁 on 2023/02/03.
//

import UIKit

final class MainTabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBar()
    }
}

private extension MainTabBarController {
    func setupTabBar() {
        let homeTab = UINavigationController(rootViewController: HomeViewController())
        homeTab.tabBarItem = UITabBarItem(
            title: "Home".localized(),
            image: UIImage(systemName: "house"),
            selectedImage: UIImage(systemName: "house.fill")
        )
        
        let humanInterfaceGuideTab = UINavigationController(rootViewController: HumanInterfaceGuideViewController())
        humanInterfaceGuideTab.tabBarItem = UITabBarItem(
            title: "HIG".localized(),
            image: UIImage(systemName: "doc.richtext"),
            selectedImage: UIImage(systemName: "doc.richtext.fill")
        )
        
        let examinationGuideTab = UINavigationController(rootViewController: ExaminationGuideViewController())
        examinationGuideTab.tabBarItem = UITabBarItem(
            title: "Examination",
            image: UIImage(systemName: "doc.plaintext"),
            selectedImage: UIImage(systemName: "doc.plaintext.fill")
        )
        
        let translateTab = UINavigationController(rootViewController: TranslateViewController())
        translateTab.tabBarItem = UITabBarItem(
            title: "Translate".localized(),
            image: UIImage(systemName: "a.circle"),
            selectedImage: UIImage(systemName: "a.circle.fill")
        )
        
        viewControllers = [
            homeTab,
            humanInterfaceGuideTab,
            examinationGuideTab,
            translateTab
        ]
    }
}
