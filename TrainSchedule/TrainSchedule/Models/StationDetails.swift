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
        traincode = dict[safeString: "Traincode"]
        stationfullname = dict[safeString: "Stationfullname"]
        stationcode = dict[safeString: "Stationcode"]
        traindate =  dict[safeString: "Traindate"]
        origin = dict[safeString: "Origin"]
        destination = dict[safeString: "Destination"]

        origintime = dict[safeString: "Origintime"]
        destinationtime = dict[safeString: "Destinationtime"]
        status =  dict[safeString: "Status"]
        lastlocation = dict[safeString: "Lastlocation"]
        duein = dict[safeString: "Duein"]

        late = dict[safeString: "Late"]
        exparrival = dict[safeString: "Exparrival"]
        expdepart =  dict[safeString: "Expdepart"]
        scharrival = dict[safeString: "Scharrival"]
        schdepart = dict[safeString: "Schdepart"]

        direction =  dict[safeString: "Direction"]
        traintype = dict[safeString: "Traintype"]
        locationtype = dict[safeString: "Locationtype"]
    }
}
