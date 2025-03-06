//
//  TabBarController.swift
//  WaterDrinking
//
//  Created by Kamil Kakar on 17/02/2025.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let homeVC = HomeViewController()
        let analyticsVC = AnalyticsController()
        let settingsVC = SettingsVC()
        let profileVC = ProfileController()
        
        homeVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "home 1"), tag: 0)
        analyticsVC.tabBarItem = UITabBarItem(title: "Analytics", image: UIImage(named: "chart-simple"), tag: 1)
        settingsVC.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "setting 1"), tag: 2)
        profileVC.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(named: "user-svgrepo-com 1"), tag: 3)
                
        // Set view controllers for the tab bar
        viewControllers = [homeVC, analyticsVC, settingsVC, profileVC]
        
        // Set selected view controller to Home
        selectedIndex = 0
    }
    
}
