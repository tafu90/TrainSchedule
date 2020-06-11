//
//  LiveTrain.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct LiveTrain {

    let trainStatus: String
    let trainCode: String
    let trainLongitude: Double
    let trainLatitude: Double
    let trainDate: String
    let direction: String
    let publicMessage: String

    init(dict: [String: String]) {
        trainStatus = dict["TrainStatus"] ?? ""
        trainCode = dict["TrainCode"] ?? ""
        trainLongitude = dict["TrainLongitude"]?.toDouble() ?? 0.0
        trainLatitude =  dict["TrainLatitude"]?.toDouble() ?? 0.0
        trainDate = dict["TrainDate"] ?? ""
        direction = dict["Direction"] ?? ""
        publicMessage = dict["PublicMessage"] ?? ""
    }
}
