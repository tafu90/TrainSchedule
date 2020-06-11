//
//  TrainMovementTableView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainMovementTableView: BaseTableView {

    weak var stationDetailsTableViewDelegate: StationDetailsTableViewDelegate?

    override func registerCells() {
        registerNib(TrainMovementTableCell.self)
    }

    //MARK: - Table Header
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: TrainMovementTableCell = dequeueReusableCell(withIdentifier: TrainMovementTableCell.reuseIdentifier, for: indexPath) as? TrainMovementTableCell else {
            fatalError("Wrong cell class")
        }

        guard let viewModel = tableViewViewModel?.cellViewModels[safe: indexPath.row] as? TrainMovementTableCellViewModel  else {
            return cell
        }

        cell.setUp(viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}
