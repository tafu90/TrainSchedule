//
//  TrainStationsViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class TrainStationsViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .black
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
