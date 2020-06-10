//
//  StationResponse.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 09/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationResponse: BaseResponseObject {

    var allStation: [Station] = []

    override func createObject(_ dict: [String : String]) {
        allStation.append(Station(dict: dict))
    }
}
