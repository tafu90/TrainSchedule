//
//  StationDetailsTableView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//


import UIKit

protocol StationDetailsTableViewDelegate: class {
    func checkTrainMove(_ code: String)
}

class StationDetailsTableView: BaseTableView {

    weak var stationDetailsTableViewDelegate: StationDetailsTableViewDelegate?

    override func registerCells() {
        registerNib(StationDetailsCell.self)
    }

    //MARK: - Table Header
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell: StationDetailsCell = dequeueReusableCell(withIdentifier: StationDetailsCell.reuseIdentifier, for: indexPath) as? StationDetailsCell else {
            fatalError("Wrong cell class")
        }

        guard let viewModel = tableViewViewModel?.cellViewModels[safe: indexPath.row] as? StationDetailsCellViewModel  else {
            return cell
        }

        cell.setUp(viewModel)
        cell.delegate = self
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
}

extension StationDetailsTableView: StationDetailsCellDelegate {
    func didSelectTrain(trainCode: String) {
        stationDetailsTableViewDelegate?.checkTrainMove(trainCode)
    }
}
