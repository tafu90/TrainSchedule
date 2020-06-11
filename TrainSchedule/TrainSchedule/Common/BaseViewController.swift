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

    func showAlert(_ message: String, title: String, completion: ((UIAlertAction) -> Void)? = nil) {

           DispatchQueue.main.async { [weak self] in
               guard let self = self else { return }
               let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
               alert.addAction(UIAlertAction.init(title: "OK", style: .cancel, handler: completion))

               self.present(alert, animated: true, completion: nil)
           }
       }
}
