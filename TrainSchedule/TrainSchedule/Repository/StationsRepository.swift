//
//  StationsRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationsRepository: BaseRepository {

    func getStation(stationType: StationType, completion: @escaping (Any?) -> Void) {

        guard let url = URL.urlGetAllStationByType(type: stationType.parameter) else { return }
        urlSession.dataTask(with: url) { (data, response, error) in
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

        guard let url = URL.urlGetAllStationByName(name: stationName) else { return }

        urlSession.dataTask(with: url) { (data, response, error) in
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
