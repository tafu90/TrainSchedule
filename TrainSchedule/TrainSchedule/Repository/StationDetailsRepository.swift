//
//  StationDetailsRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationDetailsRepository {

    private let stationCode: String

    init(stationCode: String) {
        self.stationCode = stationCode
    }

    func getStationDetails(stationMinutes: String, completion: @escaping (Any?) -> Void) {

        URLSession.shared.dataTask(with: URL.urlGetStationData(stationCode: stationCode, minutes: stationMinutes)) { (data, response, error) in
            if let data = data {

                let stationResponse = StationDetailsResponse(data: data, objectName: "objStationData")
                let viewModels = stationResponse.stationDetails.map { StationDetailsCellViewModel($0) }
                completion(viewModels)
            }
            else {
                completion(error?.localizedDescription)
            }
        }.resume()
    }
}
