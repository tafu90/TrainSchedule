//
//  TrainsTableCell.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainsTableCell: UITableViewCell, ReusableView {

    @IBOutlet weak var trainStatusLabel: UILabel!
    @IBOutlet weak var trainDateLabel: UILabel!
    @IBOutlet weak var directionLabel: UILabel!
    @IBOutlet weak var publicMessageLabel: UILabel!

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
        trainStatusLabel.text = viewModel.trainStatus
        trainDateLabel.text = viewModel.trainDate
        directionLabel.text = viewModel.direction
        publicMessageLabel.attributedText = NSAttributedString.init(string: viewModel.publicMessage)  //"kur\nna"//viewModel.publicMessage
    }
}
