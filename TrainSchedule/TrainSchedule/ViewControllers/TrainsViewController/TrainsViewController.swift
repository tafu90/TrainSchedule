//
//  TrainsViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainsViewController: BaseViewController {

    private let trainsRepository: TrainsRepository
    private let pickerData: [StationType] = [.all, .dart, .mainline, .suburban]
    private var selectedFilter = StationType.all

    @IBOutlet private weak var filterTextField: UITextField!
    @IBOutlet private weak var tableView: TrainsTableView!

    // MARK: - Initialize
    init(_ trainsRepository: TrainsRepository) {
        self.trainsRepository = trainsRepository
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Trains"

        let pickerView = PickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 250))
        let pickerViewData: [PickerViewModel] = pickerData.map({ PickerViewModel($0) })
        pickerView.setup(viewModels: pickerViewData, selectedViewModel: PickerViewModel( selectedFilter))
        filterTextField.inputView = pickerView
        pickerView.delegate = self
        tableView.dataDelegate = self
        tableView.stationDetailsTableViewDelegate = self

        filterTextField.text = selectedFilter.name
        getNewTrains()
    }

    private func getNewTrains() {
        trainsRepository.getTrains(stationType: selectedFilter) { (response) in
            if let viewModels = response as? [TrainsTableCellViewModel] {
                DispatchQueue.main.async { [weak self] in
                    guard let self = self else { return }
                    self.tableView.update(with: BaseTableViewViewModel(cellViewModels: viewModels))
                }
            }
            else {
                self.showAlert("Please try again later", title: "Error")
            }
        }
    }
}

extension TrainsViewController: StationDetailsTableViewDelegate {

    func checkTrainMove(_ code: String) {
        let trainMovementVC = AppFactory.trainMovementViewController(code)
        navigationController?.pushViewController(trainMovementVC, animated: true)
    }
}

extension TrainsViewController: TableViewUpdateProtocol {
    func tableViewDidRefresh(_ tableView: UITableView) {
         getNewTrains()
    }
}

extension TrainsViewController: PickerViewDelegate {
    
    func didSelect(index: Int) {
        selectedFilter = pickerData[index]
        filterTextField.text = selectedFilter.name
    }

    func didEndEditing() {
        view.endEditing(true)
        getNewTrains()
    }
}
