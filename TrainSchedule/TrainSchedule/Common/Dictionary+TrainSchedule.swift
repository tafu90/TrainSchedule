//
//  Dictionary+TrainSchedule.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 11/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import Foundation

extension Dictionary {

    subscript(safeString key: Key) -> String {
        return self[key] as? String ?? ""
    }

    subscript(safeBool key: Key) -> Bool {
        return self[key] as? Bool ?? false
    }

    subscript(safeInt key: Key) -> Int {
        return self[key] as? Int ?? 0
    }

    subscript(safeDouble key: Key) -> Double {
        return self[key] as? Double ?? 0.0
    }

    subscript(safeFloat key: Key) -> Float {
        return self[key] as? Float ?? 0.0
    }

    subscript(safeArray key: Key) -> [Any] {
        return self[key] as? [Any] ?? Array<Any>()
    }

    subscript(safeDict key: Key) -> [Key: Any] {
        return self[key] as? [Key: Any] ?? Dictionary<Key, Any>()
    }

    subscript(safeDate key: Key) -> Date {
        var date = self[safeDouble: key]
        date /= 1000
        return Date(timeIntervalSince1970: date)
    }

    subscript(nullableDate key: Key) -> Date? {

        guard let date = self[key] as? Double else { return nil }

        return Date(timeIntervalSince1970: date/1000)
    }

    subscript(safeDecimalFromString key: Key) -> NSDecimalNumber {

        let decimal = NSDecimalNumber(string: self[key] as? String ?? "0.0")

        if decimal == NSDecimalNumber.notANumber {
            return NSDecimalNumber.zero
        }

        return decimal
    }

    subscript(safeDecimalFromDouble key: Key) -> NSDecimalNumber {

        let decimal = NSDecimalNumber(value: self[key] as? Double ?? 0.0)

        if decimal == NSDecimalNumber.notANumber {
            return NSDecimalNumber.zero
        }

        return decimal
    }
}
