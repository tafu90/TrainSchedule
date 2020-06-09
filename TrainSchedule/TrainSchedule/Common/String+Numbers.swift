//
//  String+Numbers.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 09/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

extension String {

    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }

    func toInt() -> Int? {
        return NumberFormatter().number(from: self)?.intValue
    }
}
