//
//  URL+TrainSchedule.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 09/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

extension URL {

    private static let baseUrl = URL(string: "http://api.irishrail.ie/realtime/realtime.asmx/")

    static func urlGetAllStationByType(type: String) -> URL {
        let urlString = "getAllStationsXML_WithStationType?StationType=\(type)"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetAllStationByName(name: String) -> URL {
        let urlString = "getStationsFilterXML?StationText=\(name)"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetCurrentTrains() -> URL {
        let urlString = "getCurrentTrainsXML"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetCurrentTrainsByType() -> URL {
        let urlString = "getCurrentTrainsXML_WithTrainType"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetStationDataByName() -> URL {
        let urlString = "getStationDataByNameXML"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetStationDataByCode() -> URL {
        let urlString = "getStationDataByCodeXML"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetStationDataByCodeWithNumMins() -> URL {
        let urlString = "getStationDataByCodeXML_WithNumMins"
        return URL(string: urlString, relativeTo: baseUrl)!
    }

    static func urlGetTrainMovements() -> URL {
        let urlString = "getTrainMovementsXML"
        return URL(string: urlString, relativeTo: baseUrl)!
    }
}
