//
//  StationType.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

enum StationType {
    case all
    case mainline
    case suburban
    case dart

    var parameter: String {
        switch self {
        case .all:
            return "A"
        case .mainline:
            return "M"
        case .suburban:
            return "S"
        case .dart:
            return "D"
        }
    }
    
    var name: String {
        switch self {
        case .all:
            return "All"
        case .mainline:
            return "Mainline"
        case .suburban:
            return "Suburban"
        case .dart:
            return "Dart"
        }
    }
}
