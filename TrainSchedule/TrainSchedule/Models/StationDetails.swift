//
//  StationDetails.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct StationDetails {

    let traincode: String
    let stationfullname: String
    let stationcode: String
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

    init(dict: [String: String]) {
        traincode = dict["Traincode"] ?? ""
        stationfullname = dict["Stationfullname"] ?? ""
        stationcode = dict["Stationcode"] ?? ""
        traindate =  dict["Traindate"] ?? ""
        origin = dict["Origin"] ?? ""
        destination = dict["Destination"] ?? ""

        origintime = dict["Origintime"] ?? ""
        destinationtime = dict["Destinationtime"] ?? ""
        status =  dict["Status"] ?? ""
        lastlocation = dict["Lastlocation"] ?? ""
        duein = dict["Duein"] ?? ""

        late = dict["Late"] ?? ""
        exparrival = dict["Exparrival"] ?? ""
        expdepart =  dict["Expdepart"] ?? ""
        scharrival = dict["Scharrival"] ?? ""
        schdepart = dict["Schdepart"] ?? ""

        direction =  dict["Direction"] ?? ""
        traintype = dict["Traintype"] ?? ""
        locationtype = dict["Locationtype"] ?? ""
    }
}
