//
//  TrainMovementTableCellViewModel.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct TrainMovementTableCellViewModel: TableViewCellViewModel {

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

    init(_ station: TrainMovement) {

        traincode = station.traincode
        traindate = station.traindate
        locationCode = station.locationCode
        locationFullName = station.locationFullName
        locationOrder = station.locationOrder
        trainOrigin = station.trainOrigin
        trainDestination = station.trainDestination

        arrival = station.arrival
        departure = station.departure
        expectedArrival = station.expectedArrival == "00:00" ? "" : station.expectedArrival
        expectedDeparture = station.expectedDeparture == "00:00" ? "" : station.expectedDeparture
        scheduledArrival = station.scheduledArrival == "00:00" ? "" : station.scheduledArrival
        scheduledDeparture = station.scheduledDeparture == "00:00" ? "" : station.scheduledDeparture

        autoArrival = station.autoArrival
        autoDepart = station.autoDepart

        switch station.locationType {
        case "O":
            self.locationType = "Origin"
        case "D":
            self.locationType = "Destination"
        case "T":
            self.locationType = "TimingPoint"
        case "S":
            self.locationType = "Stop"
        default:
            self.locationType = ""
        }

        switch station.stopType {
        case "C":
            stopType = "Current"
        case "N":
            stopType = "Next"
        default:
            stopType = ""
        }
    }
}
