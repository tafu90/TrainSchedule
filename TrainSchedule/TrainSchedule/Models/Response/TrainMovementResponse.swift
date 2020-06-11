//
//  TrainMovementResponse.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class TrainMovementResponse: BaseResponseObject {

    var allMovement: [TrainMovement] = []

    override func createObject(_ dict: [String : String]) {
        allMovement.append(TrainMovement(dict: dict))
    }
}


