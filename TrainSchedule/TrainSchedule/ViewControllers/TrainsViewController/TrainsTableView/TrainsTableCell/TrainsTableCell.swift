//
//  TrainsTableCell.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainsTableCell: UITableViewCell, ReusableView {

    @IBOutlet private weak var trainStatusLabel: UILabel!
    @IBOutlet private weak var trainDateLabel: UILabel!
    @IBOutlet private weak var directionLabel: UILabel!
    @IBOutlet private weak var publicMessageLabel: UILabel!
    @IBOutlet private weak var trainCodeLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        trainStatusLabel.text = ""
        trainDateLabel.text = ""
        directionLabel.text = ""
        publicMessageLabel.text = ""
    }

     func setUp(_ viewModel: TrainsTableCellViewModel) {
        trainCodeLabel.text = viewModel.trainCode
        trainStatusLabel.text = viewModel.trainStatus
        trainDateLabel.text = viewModel.trainDate
        directionLabel.text = viewModel.direction
        publicMessageLabel.attributedText = NSAttributedString.init(string: viewModel.publicMessage)  //"kur\nna"//viewModel.publicMessage
    }
}
