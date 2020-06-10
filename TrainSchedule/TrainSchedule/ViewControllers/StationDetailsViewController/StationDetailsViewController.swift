//
//  StationDetailsViewController.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

class StationDetailsViewController: BaseViewController {

    private let stationDetailsRepository: StationDetailsRepository
    private let stationTitle: String

    // MARK: - Initialize
    init(_ stationDetailsRepository: StationDetailsRepository, stationTitle: String) {
        self.stationDetailsRepository = stationDetailsRepository
        self.stationTitle = stationTitle
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        title = stationTitle
        navigationController?.navigationBar.topItem?.title = ""

        stationDetailsRepository.getStationDetails(stationMinutes: "90") { (response) in
            print(response)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
