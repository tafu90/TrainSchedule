//
//  StationDetailsResponse.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class StationDetailsResponse: BaseResponseObject {

    var stationDetails: [StationDetails] = []

    override func createObject(_ dict: [String : String]) {
        stationDetails.append(StationDetails(dict: dict))
    }
}
