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
    let stationLatitude: Double?
    let stationLongitude: Double?
    let stationCode: String
    let stationId: Int?

    init(dict: [String: String]) {
        stationDesc = dict[safeString: "StationDesc"]
        stationAlias = dict[safeString: "StationAlias"]
        stationLatitude = dict[safeDouble: "StationLatitude"]
        stationLongitude =  dict[safeDouble: "StationLongitude"]
        stationCode = dict[safeString: "StationCode"]
        stationId = dict[safeInt: "StationId"]
    }
}
