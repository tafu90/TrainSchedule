//
//  TrainMovementViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainMovementViewController: UIViewController {

    private let trainMovementRepository: TrainMovementRepository
    private let stationTitle: String
    @IBOutlet private  weak var tableView: TrainMovementTableView!

    // MARK: - Initialize
    init(_ trainMovementRepository: TrainMovementRepository, stationTitle: String) {
        self.trainMovementRepository = trainMovementRepository
        self.stationTitle = stationTitle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataDelegate = self
        title = "Train "+stationTitle
        navigationController?.navigationBar.topItem?.title = ""
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        updateTrainMovement()
    }

    // MARK: - Private
    private func updateTrainMovement() {

        trainMovementRepository.getTrainMovement { (response) in
            if let viewModels = response as? [TrainMovementTableCellViewModel] {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.tableView.update(with: BaseTableViewViewModel(cellViewModels: viewModels))
                }
            }
        }
    }
}

extension TrainMovementViewController: TableViewUpdateProtocol {

    func tableViewDidRefresh(_ tableView: UITableView) {
        updateTrainMovement()
    }
}
