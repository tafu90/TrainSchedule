//
//  TrainMovement.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct TrainMovement {

    let traincode: String
    let traindate: String
    let locationCode: String
    let locationFullName: String
    let locationOrder: String
    let locationType: String
    let trainOrigin: String
    let trainDestination: String
    let scheduledArrival: String
    let scheduledDeparture: String
    let expectedArrival: String
    let expectedDeparture: String
    let arrival: String?
    let departure: String?
    let autoArrival: String?
    let autoDepart: String?
    let stopType: String

    init(dict: [String: String]) {
        traincode = dict[safeString: "Traincode"]
        traindate =  dict[safeString: "Traindate"]
        locationCode = dict[safeString: "LocationCode"]
        locationFullName = dict[safeString: "LocationFullName"]
        locationOrder = dict[safeString: "LocationOrder"]
        locationType = dict[safeString: "LocationType"]
        trainOrigin = dict[safeString: "TrainOrigin"]
        trainDestination = dict[safeString: "TrainDestination"]
        scheduledArrival =  dict[safeString: "ScheduledArrival"]
        scheduledDeparture = dict[safeString: "ScheduledDeparture"]
        expectedArrival = dict[safeString: "ExpectedArrival"]
        expectedDeparture = dict[safeString: "ExpectedDeparture"]

        arrival = dict["Arrival"]
        departure =  dict["Departure"]
        autoArrival = dict["AutoArrival"]
        autoDepart = dict["AutoDepart"]
        stopType =  dict[safeString: "StopType"]
    }
}
