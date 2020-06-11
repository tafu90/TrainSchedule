//
//  TrainMovementRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class TrainMovementRepository {

    private let trainCode: String

    init(trainCode: String) {
        self.trainCode = trainCode
    }

    func getTrainMovement(completion: @escaping (Any?) -> Void) {

        let dateString = Date().toString()?.addingPercentEncoding( withAllowedCharacters: NSCharacterSet.urlQueryAllowed) ?? ""

        URLSession.shared.dataTask(with: URL.urlGetTrainMovements(trainCode: trainCode, date: dateString)) { (data, response, error) in
            if let data = data {

                let stationResponse = TrainMovementResponse(data: data, objectName: "objTrainMovements")
                let viewModels = stationResponse.allMovement.map { TrainMovementTableCellViewModel($0) }
                completion(viewModels)
            }
            else {
                completion(error?.localizedDescription)
            }
        }.resume()
    }
}
