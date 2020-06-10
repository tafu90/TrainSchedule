//
//  TrainStationTableView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

protocol TrainStationTableViewDelegate: class {
    func didSelectStation(_ code: String, title: String)
}

class TrainStationTableView: BaseTableView {

    weak var trainStationTableViewDelegate: TrainStationTableViewDelegate?

    override func registerCells() {
        registerNib(TrainStationTableCell.self)
    }

    //MARK: - Table Header
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: TrainStationTableCell = dequeueReusableCell(withIdentifier: TrainStationTableCell.reuseIdentifier, for: indexPath) as? TrainStationTableCell else {
            fatalError("Wrong cell class")
        }

        guard let viewModel = tableViewViewModel?.cellViewModels[indexPath.row] as? TrainStationCellViewModel  else {
            return cell
        }

        cell.setUp(viewModel)
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if let trainStationCellViewModel = cellViewModels[indexPath.row] as? TrainStationCellViewModel {
            trainStationTableViewDelegate?.didSelectStation(trainStationCellViewModel.stationCode, title: trainStationCellViewModel.desc)
        }
    }
}
