//
//  StationsRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationsRepository {

    func getStation(stationType: StationType, completion: @escaping (Any?) -> Void) {

        URLSession.shared.dataTask(with: URL.urlGetAllStationByType(type: stationType.parameter)) { (data, response, error) in
            if let data = data {

                let stationResponse = StationResponse(data: data, objectName: "objStation")
                let viewModels = stationResponse.allStation.map { TrainStationCellViewModel($0) }
                completion(viewModels)
            }
            else {
                completion(error?.localizedDescription)
            }
        }.resume()
    }

    func getStation(stationName: String, completion: @escaping (Any?) -> Void) {

        URLSession.shared.dataTask(with: URL.urlGetAllStationByName(name: stationName)) { (data, response, error) in
            if let data = data {

                let stationResponse = StationResponse(data: data, objectName: "objStationFilter")
                let viewModels = stationResponse.allStation.map { TrainStationCellViewModel($0) }
                completion(viewModels)
            }
            else {
                completion(error?.localizedDescription)
            }
        }.resume()
    }
}
