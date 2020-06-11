//
//  StationDetailsCellViewModel.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct StationDetailsCellViewModel: TableViewCellViewModel {

    let traincode: String
    let traindate: String
    let origin: String
    let destination: String
    let origintime: String
    let destinationtime: String
    let status: String
    let lastlocation: String?
    let duein: String

    let late: String
    let exparrival: String
    let expdepart: String
    let scharrival: String
    let schdepart: String

    let direction: String
    let traintype: String
    let locationtype: String


    init(_ station: StationDetails) {

        traincode = station.traincode
        traindate = station.traindate
        origin = station.origin
        destination = station.destination
        origintime = station.origintime
        destinationtime = station.destinationtime
        status = station.status
        lastlocation = station.lastlocation

        duein = station.duein
        late = station.late
        exparrival = station.exparrival == "00:00" ? "" : station.exparrival
        expdepart = station.expdepart == "00:00" ? "" : station.expdepart
        scharrival = station.scharrival == "00:00" ? "" : station.scharrival
        schdepart = station.schdepart == "00:00" ? "" : station.schdepart

        direction = station.direction
        traintype = station.traintype

        switch station.locationtype {
        case "O":
            locationtype = "Origin"
        case "D":
            locationtype = "Destination"
        case "S":
            locationtype = "Stop"
        case "T":
            locationtype = "TimingPoint"
        default:
            locationtype = ""
        }
    }
}
