//
//  LiveTrainResponse.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class LiveTrainResponse: BaseResponseObject {

    var liveTrains: [LiveTrain] = []

    override func createObject(_ dict: [String : String]) {
        liveTrains.append(LiveTrain(dict: dict))
    }
}
