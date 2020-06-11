//
//  TrainStationFilterViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

protocol TrainStationFilterViewControllerDelegate: class {
    func didMakeSearch(name: String, stationType: StationType)
}

class TrainStationFilterViewController: UIViewController {

    private enum Constants {
        static let animationDuration = 0.35
        static let blurrColor = UIColor.black.withAlphaComponent(0.7)
        static let pickerData: [StationType] = [.all, .dart, .mainline, .suburban]
    }

    @IBOutlet private weak var backgroundButton: UIButton!
    @IBOutlet private weak var segmentController: UISegmentedControl!
    @IBOutlet private weak var nameTextField: UITextField!
    @IBOutlet private weak var typeTextField: UITextField!
    @IBOutlet private weak var buttonSearch: UIButton!
    @IBOutlet private weak var buttonCancel: UIButton!
    @IBOutlet private weak var centeredView: UIView!

    private var filterStationType: StationType = .all
    private var filterSectedName: String = ""

    weak var delegate: TrainStationFilterViewControllerDelegate?

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        centeredView.clipsToBounds = true
        centeredView.layer.cornerRadius = 5
        view.backgroundColor = UIColor.clear

        segmentController.selectedSegmentIndex = 0
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        makeAnimation(hideMenu: false, color: TrainStationFilterViewController.Constants.blurrColor)
    }

    // MARK: - Set Up
    func setFilter(name: String, stationType: StationType) {
        let pickerView = PickerView(frame: CGRect(x: 0, y: 0, width: 0, height: 250))
        let pickerViewData: [PickerViewModel] = TrainStationFilterViewController.Constants.pickerData.map({ PickerViewModel($0) })
        pickerView.setup(viewModels: pickerViewData, selectedViewModel: PickerViewModel(stationType))
        typeTextField.inputView = pickerView
        pickerView.delegate = self

        typeTextField.text = stationType.name
        nameTextField.text = name

        if name.isEmpty {
            segmentController.selectedSegmentIndex = 1
            nameTextField.isHidden = true
        }
        else {
            typeTextField.isHidden = true
        }
    }

    // Animations for show/hide controller
    private func makeAnimation(hideMenu: Bool, color: UIColor, completion: (() -> Void)? = nil) {

        UIView.animate(withDuration: TrainStationFilterViewController.Constants.animationDuration, animations: {
            self.backgroundButton.backgroundColor = color
            self.backgroundButton.layoutIfNeeded()
            self.centeredView.alpha = hideMenu ? 0 : 1
            }, completion: { _ in
                completion?()
        })
    }

    // MARK: - Actions
    @IBAction func didEndOnExit(_ sender: Any) {}

    @IBAction func searchButtonTapped(_ sender: Any) {
        if segmentController.selectedSegmentIndex == 0 {
            delegate?.didMakeSearch(name: nameTextField.text ?? "", stationType: .all)
        }
        else {
            delegate?.didMakeSearch(name: "", stationType: filterStationType)
        }
        
        makeAnimation(hideMenu: true, color: UIColor.clear) {
            self.dismiss(animated: false, completion: nil)
        }
    }

    @IBAction func segmentControllerTapped(_ sender: Any) {
        switch segmentController.selectedSegmentIndex {
        case 0:
            nameTextField.isHidden = false
            typeTextField.isHidden = true
        case 1:
            nameTextField.isHidden = true
            typeTextField.isHidden = false
        default:
            return
        }
        view.endEditing(true)
    }

    @IBAction func backgroundButtonTapped(_ sender: Any) {
        if typeTextField.isFirstResponder || nameTextField.isFirstResponder {
            view.endEditing(true)
        }
        else {
            makeAnimation(hideMenu: true, color: UIColor.clear) {
                self.dismiss(animated: false, completion: nil)
            }
        }
    }

    @IBAction func cancelButtonTapped(_ sender: Any) {
        makeAnimation(hideMenu: true, color: UIColor.clear) {
            self.dismiss(animated: false, completion: nil)
        }
    }
}

extension TrainStationFilterViewController: PickerViewDelegate {

    func didEndEditing() {
        view.endEditing(true)
    }

    func didSelect(index: Int) {
        filterStationType = TrainStationFilterViewController.Constants.pickerData[index]
        typeTextField.text = filterStationType.name
    }
}
