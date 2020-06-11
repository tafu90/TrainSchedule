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
    private var searchedText: String = ""
    private var searchedType: StationType = .all

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
        trainStationTableView.trainStationTableViewDelegate = self
        addRightButton(image: UIImage(named: "filter"))
        getAllStation()
    }

    func getAllStation() {

        if searchedText.isEmpty {
            stationsRepository.getStation(stationType: searchedType) { [weak self] (response) in
                guard let self = self else { return }
                self.updateTableData(response: response)
            }
        }
        else {
            stationsRepository.getStation(stationName: searchedText) { [weak self]  (response) in
                guard let self = self else { return }
                self.updateTableData(response: response)
            }
        }
    }

    private func updateTableData(response: Any?) {
        if let viewModels = response as? [TrainStationCellViewModel] {
            DispatchQueue.main.async {
                self.trainStationTableView.update(with: BaseTableViewViewModel(cellViewModels: viewModels))
            }
        }
        else {
            self.showAlert("Please try again later", title: "Error")
        }
    }

    @objc override func rightButtonTapped() {

        let filetVC = TrainStationFilterViewController()
        filetVC.modalPresentationStyle = .overFullScreen
        self.present(filetVC, animated: false, completion: nil)
        filetVC.setFilter(name: searchedText, stationType: searchedType)
        filetVC.delegate = self
    }
}

extension TrainStationsViewController: TableViewUpdateProtocol {

    func tableViewDidRefresh(_ tableView: UITableView) {
        getAllStation()
    }
}

extension TrainStationsViewController: TrainStationTableViewDelegate {
    func didSelectStation(_ code: String, title: String) {
        navigationController?.pushViewController(AppFactory.stationDetailsViewController(code: code, title: title), animated: true)
    }
}

extension TrainStationsViewController: TrainStationFilterViewControllerDelegate {

    func didMakeSearch(name: String, stationType: StationType) {
        searchedText = name
        searchedType = stationType
        getAllStation()
    }
}
