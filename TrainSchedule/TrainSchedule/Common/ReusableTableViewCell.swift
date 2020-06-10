//
//  ReusableTableViewCell.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

typealias ReusableTableViewCell = ReusableView & UITableViewCell

extension UITableView {

    func registerNib(_ cellType: ReusableTableViewCell.Type) {

        let cellNib = UINib(nibName: String(describing: cellType), bundle: Bundle.main)
        register(cellNib, forCellReuseIdentifier: cellType.reuseIdentifier)
    }

}
