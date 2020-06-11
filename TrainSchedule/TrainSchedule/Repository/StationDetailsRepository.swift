//
//  StationDetailsRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationDetailsRepository: BaseRepository {

    private let stationCode: String

    init(stationCode: String, urlSession: URLSession) {
        self.stationCode = stationCode
        super.init(urlSession: urlSession)
    }

    func getStationDetails(stationMinutes: String, completion: @escaping (Any?) -> Void) {

        guard let url = URL.urlGetStationData(stationCode: stationCode, minutes: stationMinutes) else { return }

        urlSession.dataTask(with: url) { (data, response, error) in
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
