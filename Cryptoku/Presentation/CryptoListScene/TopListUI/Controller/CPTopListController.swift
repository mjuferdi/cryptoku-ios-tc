//
//  CPTopListController.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//  Copyright (c) 2021 All rights reserved.

import UIKit

// MARK: CPTopListController
final class CPTopListController: UIViewController {

    // MARK: DI Variable
    lazy var _view: CPTopListView = DefaultCPTopListView()
    var viewModel: CPTopListViewModel!

    // MARK: Common Variable
    let refreshControl = UIRefreshControl()
    var toplistDomain: ToplistTopTierDomain!

    // MARK: Create Function
    class func create(with viewModel: CPTopListViewModel) -> CPTopListController {
        let controller = CPTopListController()
        controller.viewModel = viewModel
        return controller
    }

    // MARK: UIViewController Function
    override func loadView() {
        self.view = (self._view as! UIView)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
        self.setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Toplists"
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self._view.viewWillAppear(navigationBar: self.navigationController?.navigationBar,
                                  navigationItem: self.navigationItem,
                                  tabBarController: self.tabBarController)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self._view.viewWillDisappear()
    }

    // MARK: Bind ViewModel Function
    private func bind(to viewModel: CPTopListViewModel) {
        viewModel.displayedAllertMessage.observe(on: self) { [unowned self] in
            self.observeDisplayedAllertMessageViewModel($0)
        }
        viewModel.displayedToplist.observe(on: self) { [unowned self] in
            guard let value = $0 else { return }
            self.observeDisplayedToplistViewModel(value)
        }
        viewModel.displayedLoadingState.observe(on: self) { [unowned self] in
            self.observeDisplayedLoadingStateViewModel($0)
        }
    }
    
    private func setupTableViewFunctionality() {
        self._view.tableView.dataSource = self
        self._view.tableView.delegate = self
        self._view.tableView.reloadData()
    }
    
    private func setupView() {
        if #available(iOS 11.0, *) {
            self._view.tableView.refreshControl = refreshControl
        } else {
            self._view.tableView.addSubview(refreshControl)
        }
        refreshControl.addTarget(self, action: #selector(self.refreshCurrencyData), for: .valueChanged)
    }
    
    @objc
    func refreshCurrencyData() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.viewModel.fetchTopListCryptoCurrency()
        }
    }
    
}

// MARK: Observe ViewModel Function
extension CPTopListController {
    func observeDisplayedAllertMessageViewModel(_ show: Bool) {
        if show {
            self.viewModel.showAllertMessage(to: self)
        }
    }
    
    func observeDisplayedToplistViewModel(_ toplist: ToplistTopTierDomain) {
        self.toplistDomain = toplist
        DispatchQueue.main.async {
            self.setupTableViewFunctionality()
        }
    }
    
    func observeDisplayedLoadingStateViewModel(_ bool: Bool) {
        if refreshControl.isRefreshing == true {
            refreshControl.endRefreshing()
        }
    }
}

// MARK: CPTopListViewDelegate
extension CPTopListController: CPTopListViewDelegate {

}
