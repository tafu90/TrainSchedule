//
//  BaseViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    func addRightButton(image: UIImage?) {
        
        let filterButton = UIBarButtonItem(image: image, style: .done, target: self, action: #selector(rightButtonTapped))
        filterButton.tintColor = UIColor.black
        self.navigationItem.rightBarButtonItem = filterButton
    }

    @objc func rightButtonTapped() {
    }
}
