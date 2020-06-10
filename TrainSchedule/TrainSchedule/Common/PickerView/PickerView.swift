//
//  PickerView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

struct PickerViewModel {
    let parameter: String
    let name: String?

    init(_ stationType: StationType) {
        self.parameter = stationType.parameter
        self.name = stationType.name
    }
}

protocol PickerViewDelegate: class {
    func didSelect(index: Int)
    func didEndEditing()
}

class PickerView: UIView {

    weak var delegate: PickerViewDelegate?

    private var pickerViewDataSource: [PickerViewModel] = []

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var doneButton: UIButton!
    @IBOutlet private weak var pickerView: UIPickerView!

    // MARK: - Initialize
    override init(frame: CGRect) {

        super.init(frame: frame)
        Bundle.main.loadNibNamed(String(describing: type(of: self)), owner: self, options: nil)

        contentView.frame = self.bounds
        addSubview(contentView)
        style()
    }

    required init?(coder aDecoder: NSCoder) {
       fatalError("init(coder:) has not been implemented")
    }

    private func style() {
        contentView.backgroundColor = UIColor.white
        pickerView.dataSource = self
        pickerView.delegate = self
    }

    func setup(viewModels: [PickerViewModel], selectedViewModel: PickerViewModel) {
        pickerViewDataSource = viewModels
        pickerView.reloadAllComponents()
        if let firstIndex = viewModels.firstIndex(where: {$0.parameter == selectedViewModel.parameter}) {
            pickerView.selectedRow(inComponent: firstIndex)
        }
    }

    // MARK: - Action
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.didEndEditing()
    }
}

extension PickerView: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewDataSource.count
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        delegate?.didSelect(index: pickerView.selectedRow(inComponent: 0))
    }
}

extension PickerView: UIPickerViewDelegate {

    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {

        var attributes = [NSAttributedString.Key: AnyObject]()
        attributes[.foregroundColor] = UIColor.black
        return NSAttributedString(string: pickerViewDataSource[row].name ?? "", attributes: attributes)
    }
}
