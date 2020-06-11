//
//  Date+TrainSchedule.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

enum DateFormat: String {
    case dateOnly = "dd MMM yyyy"
    case timeOnly = "HH:mm"
}

extension Date {

    func toString(format: DateFormat = .dateOnly) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format.rawValue
        dateFormatter.timeZone = .current

        return dateFormatter.string(from: self)
    }
}
