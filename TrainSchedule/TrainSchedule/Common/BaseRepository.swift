//
//  BaseRepository.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

enum Result<Value, Error: Swift.Error> {
    case success(Value)
    case failure(String)
}

class BaseRepository {

    let urlSession: URLSession

    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
}
