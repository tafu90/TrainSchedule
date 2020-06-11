//
//  TrainsTableView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainsTableView: BaseTableView {

    weak var stationDetailsTableViewDelegate: StationDetailsTableViewDelegate?

    override func registerCells() {
        registerNib(TrainsTableCell.self)
    }

    //MARK: - Table Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: TrainsTableCell = dequeueReusableCell(withIdentifier: TrainsTableCell.reuseIdentifier, for: indexPath) as? TrainsTableCell else {
            fatalError("Wrong cell class")
        }

        guard let viewModel = tableViewViewModel?.cellViewModels[indexPath.row] as? TrainsTableCellViewModel  else {
            return cell
        }

        cell.setUp(viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let viewModel = cellViewModels[indexPath.row] as? TrainsTableCellViewModel {
            stationDetailsTableViewDelegate?.checkTrainMove(viewModel.trainCode)
        }
    }
}
