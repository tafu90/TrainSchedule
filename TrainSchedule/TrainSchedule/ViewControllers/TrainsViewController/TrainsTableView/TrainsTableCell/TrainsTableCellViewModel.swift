//
//  TrainsTableCellViewModel.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct TrainsTableCellViewModel: TableViewCellViewModel {

    let trainStatus: String
    let trainCode: String
    let trainDate: String
    let direction: String
    let publicMessage: String

    init(_ train: LiveTrain) {

        trainCode = train.trainCode
        trainDate = train.trainDate
        direction = train.direction

        switch train.trainStatus {
        case "N":
            trainStatus = "Not yet running"
        case "R":
            trainStatus = "Running"
        default:
            trainStatus = train.trainStatus
        }

        let newText = train.publicMessage.replacingOccurrences(of: "\\n", with: "\n")
        publicMessage = newText
    }
}
