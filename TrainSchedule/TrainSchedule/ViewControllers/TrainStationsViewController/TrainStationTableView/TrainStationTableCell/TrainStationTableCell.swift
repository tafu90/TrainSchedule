//
//  TrainStationTableCell.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainStationTableCell: UITableViewCell, ReusableView {

    @IBOutlet private weak var stationDescLabel: UILabel!
    @IBOutlet private weak var stationAliasStackView: UIStackView!
    @IBOutlet private weak var stationAlialLabel: UILabel!
    @IBOutlet private weak var stationCodeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        stationDescLabel.text = ""
        stationAliasStackView.isHidden = false
        stationAlialLabel.text = ""
        stationCodeLabel.text = ""
    }

    func setUp(_ viewModel: TrainStationCellViewModel) {
            self.stationDescLabel.text = viewModel.desc
            self.stationAliasStackView.isHidden = viewModel.alias.isEmpty
            self.stationAlialLabel.text = viewModel.alias
            self.stationCodeLabel.text = viewModel.stationCode
    }
}
