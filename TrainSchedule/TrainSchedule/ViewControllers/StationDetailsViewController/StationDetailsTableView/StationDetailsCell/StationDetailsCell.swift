//
//  StationDetailsCell.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

protocol StationDetailsCellDelegate: class {
    func didSelectTrain(trainCode: String)
}

class StationDetailsCell: UITableViewCell, ReusableView {

    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var originStopLabel: UILabel!
    @IBOutlet private weak var destinationStopLabel: UILabel!
    @IBOutlet private weak var originTimeLabel: UILabel!
    @IBOutlet private weak var destinationTimeLabel: UILabel!

    @IBOutlet private weak var statusLabel: UILabel!
    @IBOutlet private weak var lastLocationLabel: UILabel!
    @IBOutlet private weak var dueinLabel: UILabel!
    @IBOutlet private weak var lateLabel: UILabel!

    @IBOutlet private weak var expectArrivalLabel: UILabel!
    @IBOutlet private weak var expectDepartLabel: UILabel!
    @IBOutlet private weak var scheduleArrivalLabel: UILabel!
    @IBOutlet private weak var scheduleDepartLabel: UILabel!
    @IBOutlet private weak var directionLabel: UILabel!
    @IBOutlet private weak var trainTypeLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!

    @IBOutlet private weak var lastLocationStackView: UIStackView!
    @IBOutlet private weak var expectedArrivalStackView: UIStackView!
    @IBOutlet private weak var expectedDepartStackView: UIStackView!
    @IBOutlet private weak var scheduleArrivalStackView: UIStackView!
    @IBOutlet private weak var scheduleDepartStackView: UIStackView!

    private var trainCode: String = ""
    weak var delegate: StationDetailsCellDelegate?

    override func awakeFromNib() {
        lastLocationStackView.isHidden = true
        super.awakeFromNib()
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        dateLabel.text = ""
        originStopLabel.text = ""
        destinationStopLabel.text = ""
        originTimeLabel.text = ""
        destinationTimeLabel.text = ""
        statusLabel.text = ""
        lastLocationLabel.text = ""
        dueinLabel.text = ""
        lateLabel.text = ""
        expectArrivalLabel.text = ""
        expectDepartLabel.text = ""
        scheduleArrivalLabel.text = ""
        scheduleDepartLabel.text = ""
        directionLabel.text = ""
        trainTypeLabel.text = ""
        locationLabel.text = ""

        lastLocationStackView.isHidden = true
        expectedArrivalStackView.isHidden = true
        expectedDepartStackView.isHidden = true
        scheduleArrivalStackView.isHidden = true
        scheduleDepartStackView.isHidden = true

        trainCode = ""
    }

    func setUp(_ viewModel: StationDetailsCellViewModel) {
        dateLabel.text = viewModel.traindate
        originStopLabel.text = viewModel.origin
        destinationStopLabel.text = viewModel.destination
        originTimeLabel.text = viewModel.origintime
        destinationTimeLabel.text = viewModel.destinationtime
        statusLabel.text = viewModel.status

        if let lastLocation = viewModel.lastlocation, !lastLocation.isEmpty {
            lastLocationLabel.text = lastLocation
            lastLocationStackView.isHidden = false
        }

        dueinLabel.text = viewModel.duein
        lateLabel.text = viewModel.late

        expectArrivalLabel.text = viewModel.exparrival
        expectedArrivalStackView.isHidden = viewModel.exparrival.isEmpty

        expectDepartLabel.text = viewModel.expdepart
        expectedDepartStackView.isHidden = viewModel.expdepart.isEmpty

        scheduleArrivalLabel.text = viewModel.scharrival
        scheduleArrivalStackView.isHidden = viewModel.scharrival.isEmpty

        scheduleDepartLabel.text = viewModel.scharrival
        scheduleDepartStackView.isHidden = viewModel.scharrival.isEmpty

        directionLabel.text = viewModel.direction
        trainTypeLabel.text = viewModel.traintype
        locationLabel.text = viewModel.locationtype

        trainCode = viewModel.traincode
    }

    @IBAction func checkTrainMovementOnClick(_ sender: Any) {
        delegate?.didSelectTrain(trainCode: trainCode)
    }
}
