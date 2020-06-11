//
//  AppFactory.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

class AppFactory {

    static func trainMovementViewController(_ trainCode: String) -> TrainMovementViewController {
        let trainMovementRepository = TrainMovementRepository(trainCode: trainCode)
        return TrainMovementViewController(trainMovementRepository, stationTitle: trainCode)
    }

    static func trainStationsViewController() -> TrainStationsViewController {
        return TrainStationsViewController(StationsRepository())
    }

    static func stationDetailsViewController(code: String, title: String) -> StationDetailsViewController {
        let stationDetailsRepository = StationDetailsRepository(stationCode: code)
        let stationDetailsVC = StationDetailsViewController(stationDetailsRepository, stationTitle: title)

        return stationDetailsVC
    }
}
