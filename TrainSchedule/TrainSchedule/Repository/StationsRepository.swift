//
//  StationsRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationsRepository {

    func getAllStation(completion: @escaping (Any?) -> Void) {

        URLSession.shared.dataTask(with: URL.urlGetAllStation()) { (data, response, error) in
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
}
