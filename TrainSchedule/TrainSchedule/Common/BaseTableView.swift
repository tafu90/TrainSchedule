//
//  BaseTableView.swift
//  TrainSchedule
//
//  Created by Stanislav Kostov on 10/06/2020.
//  Copyright © 2020 Stanislav Kostov. All rights reserved.
//

import UIKit

protocol TableViewCellViewModel {}

protocol TableViewUpdateProtocol: class {
    func tableViewDidRefresh(_ tableView: UITableView)
}

protocol BaseTableViewViewModelProtocol {
    var cellViewModels: [TableViewCellViewModel] { get set }
}

struct BaseTableViewViewModel: BaseTableViewViewModelProtocol {
    var cellViewModels: [TableViewCellViewModel]
}

class BaseTableView: UITableView, UITableViewDataSource, UITableViewDelegate {

    weak var dataDelegate: TableViewUpdateProtocol?
    var currentOffset: Int = 0

    lazy var tableNoDataView: UIView? = {
        return makeNoDataView()
    }()

    private var isRefreshing: Bool = false

    var cellViewModels: [TableViewCellViewModel] {
        return tableViewViewModel?.cellViewModels ?? []
    }

    var tableViewViewModel: BaseTableViewViewModelProtocol? {
        didSet {
            guard !isRefreshing else { return }

            guard let tableViewViewModel = tableViewViewModel,
                !tableViewViewModel.cellViewModels.isEmpty else {
                    backgroundView = tableNoDataView
                    return
            }
            backgroundView = nil
        }
    }

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setup()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func setup() {

        delegate = self
        dataSource = self

        rowHeight = UITableView.automaticDimension
        estimatedRowHeight = 120
        backgroundColor = UIColor.white

        registerCells()
        registerKeyboardNotifications()
        customSetup()

        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.blue
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)

        self.refreshControl = refreshControl
    }

    func disablePullToRefresh() {
        refreshControl = nil
    }

    // MARK: - Update
    func update(with tableViewModel: BaseTableViewViewModelProtocol) {

        if refreshControl?.isRefreshing ?? false {
            refreshControl?.endRefreshing()
        }

        isRefreshing = false
        self.tableViewViewModel = tableViewModel

        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.reloadData()
        }
    }

    func didFailToLoadData() {

        if refreshControl?.isRefreshing ?? false {
            refreshControl?.endRefreshing()
        }

        isRefreshing = false
    }

    @objc func refresh() {
        isRefreshing = true
        dataDelegate?.tableViewDidRefresh(self)
    }

    // MARK: - Misc.
    func registerCells() {
        fatalError("Should override")
    }

    func customSetup() {}

    func registerKeyboardNotifications() {}

    func makeNoDataView() -> UIView? {

        let noDataLabel = UILabel.init(frame: CGRect(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width))
        noDataLabel.textAlignment = .center
        noDataLabel.text = "No data available"
        noDataLabel.backgroundColor = UIColor.white
        return noDataLabel
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModels.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        fatalError("Should override")
    }
}

