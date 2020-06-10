//
//  TrainStationCellViewModel.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

struct TrainStationCellViewModel: TableViewCellViewModel {

    let desc: String
    let alias: String
    let stationCode: String
    let stationId: Int

    init(_ station: Station) {
        self.desc = station.stationDesc
        self.alias = station.stationAlias ?? ""
        self.stationCode = station.stationCode
        self.stationId = station.stationId
    }
}
