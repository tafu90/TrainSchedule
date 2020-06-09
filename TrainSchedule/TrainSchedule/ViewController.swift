//
//  ViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 09/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        getAllStation { (response) in
            print(response)
        }
    }

    func getAllStation(completion: @escaping (Any?) -> Void) {

            URLSession.shared.dataTask(with: URL.urlGetAllStation()) { (data, response, error) in
                if let data = data {

                    let stationResponse = StationResponse(data: data, objectName: "objStation")
                    print(stationResponse.allStation.count)
                    completion(stationResponse)
                }
                else {
                    completion(error?.localizedDescription)
                }
            }.resume()
        }
}
