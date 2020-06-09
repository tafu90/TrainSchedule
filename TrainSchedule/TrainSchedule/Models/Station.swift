//
//  Station.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 09/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct Station {

    let stationDesc: String
    let stationAlias: String?
    let stationLatitude: Double
    let stationLongitude: Double
    let stationCode: String
    let stationId: Int

    init(dict: [String: String]) {
        stationDesc = dict["StationDesc"] ?? ""
        stationAlias = dict["StationAlias"]
        stationLatitude = dict["StationLatitude"]?.toDouble() ?? 0.0
        stationLongitude =  dict["StationLongitude"]?.toDouble() ?? 0.0
        stationCode = dict["StationCode"] ?? ""
        stationId = dict["StationId"]?.toInt() ?? 0
    }
}
