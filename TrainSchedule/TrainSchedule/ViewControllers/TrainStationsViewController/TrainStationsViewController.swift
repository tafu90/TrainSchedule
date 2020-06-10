//
//  TrainStationsViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainStationsViewController: UIViewController {

    @IBOutlet private weak var trainStationTableView: TrainStationTableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Train Stations"
        trainStationTableView.dataDelegate = self

        getAllStation { (response) in
            print(response)
        }
    }

    func getAllStation(completion: @escaping (Any?) -> Void) {

        URLSession.shared.dataTask(with: URL.urlGetAllStation()) { (data, response, error) in
            if let data = data {

                let stationResponse = StationResponse(data: data, objectName: "objStation")
                let viewModels = stationResponse.allStation.map { TrainStationCellViewModel($0) }

                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.trainStationTableView.update(with: BaseTableViewViewModel(cellViewModels: viewModels))
                }
                completion(stationResponse)
            }
            else {
                completion(error?.localizedDescription)
            }
        }.resume()
    }
}

extension TrainStationsViewController: TableViewUpdateProtocol {

    func tableViewDidRefresh(_ tableView: UITableView) {
        getAllStation { (response) in
            print(response)
        }
    }
}
