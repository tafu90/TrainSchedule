//
//  TrainMovementTableCell.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainMovementTableCell: UITableViewCell, ReusableView {

    @IBOutlet private weak var locationNameLabel: UILabel!
    @IBOutlet private weak var locationTypeLabel: UILabel!
    @IBOutlet private weak var trainModelLabel: UILabel!
    @IBOutlet private weak var schedArrivalLabel: UILabel!
    @IBOutlet private weak var schedDepartLabel: UILabel!
    @IBOutlet private weak var expectArrivalLabel: UILabel!
    @IBOutlet private weak var expectDepartureLabel: UILabel!

    @IBOutlet private weak var arrivalLabel: UILabel!
    @IBOutlet private weak var departureLabel: UILabel!
    @IBOutlet private weak var autoArrivalLabel: UILabel!
    @IBOutlet private weak var stopTypeLabel: UILabel!

    @IBOutlet private weak var arrivalStackView: UIStackView!
    @IBOutlet private weak var departureStackView: UIStackView!
    @IBOutlet private weak var autoArrivalStackView: UIStackView!
    @IBOutlet private weak var stopTypeStackView: UIStackView!


    override func awakeFromNib() {
        super.awakeFromNib()

        arrivalStackView.isHidden = true
        departureStackView.isHidden = true
        autoArrivalStackView.isHidden = true
        stopTypeStackView.isHidden = true
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        locationNameLabel.text = ""
        locationTypeLabel.text = ""
        trainModelLabel.text = ""
        schedArrivalLabel.text = ""
        schedDepartLabel.text = ""
        expectArrivalLabel.text = ""
        expectDepartureLabel.text = ""
        arrivalLabel.text = ""
        departureLabel.text = ""
        autoArrivalLabel.text = ""
        stopTypeLabel.text = ""
    }

    func setUp(_ viewModel: TrainMovementTableCellViewModel) {

        locationNameLabel.text = viewModel.locationFullName
        locationTypeLabel.text = viewModel.locationType
        trainModelLabel.text = viewModel.trainOrigin
        schedArrivalLabel.text = viewModel.scheduledArrival
        schedDepartLabel.text = viewModel.scheduledDeparture
        expectArrivalLabel.text = viewModel.expectedDeparture
        expectDepartureLabel.text = viewModel.expectedArrival

        arrivalStackView.isHidden = viewModel.arrival == nil || viewModel.arrival?.isEmpty ?? true
        departureStackView.isHidden = viewModel.departure == nil || viewModel.departure?.isEmpty ?? true
        autoArrivalStackView.isHidden = viewModel.autoArrival == nil || viewModel.autoArrival?.isEmpty ?? true
        stopTypeStackView.isHidden = viewModel.stopType.isEmpty

        arrivalLabel.text = viewModel.arrival
        departureLabel.text = viewModel.departure
        autoArrivalLabel.text = viewModel.autoArrival
        stopTypeLabel.text = viewModel.stopType
    }
}
