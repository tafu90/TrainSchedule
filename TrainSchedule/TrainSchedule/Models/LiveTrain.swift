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
        trainStatus = dict[safeString: "TrainStatus"]
        trainCode = dict[safeString: "TrainCode"]
        trainLongitude = dict[safeDouble: "TrainLongitude"]
        trainLatitude =  dict[safeDouble: "TrainLatitude"]
        trainDate = dict[safeString: "TrainDate"]
        direction = dict[safeString: "Direction"]
        publicMessage = dict[safeString: "PublicMessage"]
    }
}
