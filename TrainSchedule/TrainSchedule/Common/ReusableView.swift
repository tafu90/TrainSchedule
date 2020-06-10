//
//  ReusableView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

extension ReusableView {

    public static var reuseIdentifier: String {
        return String(describing: self)
    }
}
