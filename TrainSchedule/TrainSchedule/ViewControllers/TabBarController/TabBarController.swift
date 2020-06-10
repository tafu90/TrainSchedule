//
//  TabBarController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, UITabBarControllerDelegate {

    // MARK: - Initializer
    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        addTabs()
    }

    private func addTabs() {
        var tabBarTabs: [UINavigationController] = []

        // Train Stations
        let trainStationsNavController = UINavigationController(rootViewController: TrainStationsViewController(StationsRepository()))
        tabBarTabs.append(styleController(navController: trainStationsNavController, title: "Stations", imageName: "trainStation", tag: 0))

        // Trains
        let trainsNavController = UINavigationController(rootViewController: TrainsViewController())
        tabBarTabs.append(styleController(navController: trainsNavController, title: "Trains", imageName: "train", tag: 1))

        setViewControllers(tabBarTabs, animated: true)
    }

    // MARK: - Misc.
    private func styleController(navController: UINavigationController, title: String, imageName: String, tag: Int) -> UINavigationController {
        let tabBarItem = UITabBarItem(title: title, image: UIImage(named: imageName), tag: tag)
        navController.tabBarItem = tabBarItem
        return navController
    }
}
