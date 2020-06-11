//
//  TrainsRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class TrainsRepository: BaseRepository {

    func getTrains(stationType: StationType, completion: @escaping (Any?) -> Void) {

        guard let url = URL.urlGetCurrentTrainsByType(type: stationType.parameter) else { return }
        urlSession.dataTask(with: url) { (data, response, error) in
            if let data = data {

                let stationResponse = LiveTrainResponse(data: data, objectName: "objTrainPositions")
                let viewModels = stationResponse.liveTrains.map { TrainsTableCellViewModel($0) }
                completion(viewModels)
            }
            else {
                completion(error?.localizedDescription)
            }
        }.resume()
    }
}
