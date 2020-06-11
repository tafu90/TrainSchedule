//
//  StationDetailsViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class StationDetailsViewController: BaseViewController {

    private let stationDetailsRepository: StationDetailsRepository
    private let stationTitle: String
    @IBOutlet private weak var sliderView: UISlider!
    @IBOutlet private weak var sliderValueLabel: UILabel!
    @IBOutlet private weak var tableView: StationDetailsTableView!


    // MARK: - Initialize
    init(_ stationDetailsRepository: StationDetailsRepository, stationTitle: String) {
        self.stationDetailsRepository = stationDetailsRepository
        self.stationTitle = stationTitle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        title = stationTitle
        navigationController?.navigationBar.topItem?.title = ""
        tableView.dataDelegate = self
        tableView.stationDetailsTableViewDelegate = self
        updateStationDetails()
    }

    // MARK: - Action
    @IBAction func sliderDidChangeValue(_ sender: Any, forEvent event: UIEvent) {

        sliderValueLabel.text = String(Int(sliderView.value))+" min"

        if let touchEvent = event.allTouches?.first {
            switch touchEvent.phase {
            case .ended:
                 updateStationDetails()
            default:
                break
            }
        }
    }

    private func updateStationDetails() {
        stationDetailsRepository.getStationDetails(stationMinutes: String(Int(sliderView.value))) { [weak self]  (response) in

            guard let self = self else { return }
            if let viewModels = response as? [StationDetailsCellViewModel] {
                DispatchQueue.main.async {
                    self.tableView.update(with: BaseTableViewViewModel(cellViewModels: viewModels))
                }
            }
            else {
                self.showAlert("Please try again later", title: "Error")
            }
        }
    }
}

extension StationDetailsViewController: TableViewUpdateProtocol {

    func tableViewDidRefresh(_ tableView: UITableView) {
        updateStationDetails()
    }
}

extension StationDetailsViewController: StationDetailsTableViewDelegate {

    func checkTrainMove(_ code: String) {
        let trainMovementVC = AppFactory.trainMovementViewController(code)
        navigationController?.pushViewController(trainMovementVC, animated: true)
    }
}
