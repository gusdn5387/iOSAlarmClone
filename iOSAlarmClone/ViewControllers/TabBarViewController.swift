//
//  TabBarViewController.swift
//  iOSAlarmClone
//
//  Created by 박현우 on 2022/06/01.
//

import Foundation
import UIKit

class TabBarViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
}

extension TabBarViewController {
    // MARK: 탭 바 설정
    private func setupTabBar() {
        self.tabBar.tintColor = .systemOrange
        self.tabBar.unselectedItemTintColor = .systemGray3
    }
}
