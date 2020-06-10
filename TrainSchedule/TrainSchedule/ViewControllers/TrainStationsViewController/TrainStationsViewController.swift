//
//  TrainStationsViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainStationsViewController: BaseViewController {

    @IBOutlet private weak var trainStationTableView: TrainStationTableView!
    private let stationsRepository: StationsRepository

    // MARK: - Initialize
    init(_ stationsRepository: StationsRepository) {
        self.stationsRepository = stationsRepository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Train Stations"
        trainStationTableView.dataDelegate = self
        addRightButton(image: UIImage(named: "filter"))
        getAllStation()
    }

    func getAllStation() {

        stationsRepository.getAllStation { (response) in
            if let viewModels = response as? [TrainStationCellViewModel] {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.trainStationTableView.update(with: BaseTableViewViewModel(cellViewModels: viewModels))
                }
            }
        }
    }

    @objc override func rightButtonTapped() {
        print("Open Filter View")
    }
}

extension TrainStationsViewController: TableViewUpdateProtocol {

    func tableViewDidRefresh(_ tableView: UITableView) {
        getAllStation()
    }
}
