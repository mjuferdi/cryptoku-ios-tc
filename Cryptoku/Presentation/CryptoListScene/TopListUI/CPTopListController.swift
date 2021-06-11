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
    }
    
}

// MARK: Observe ViewModel Function
extension CPTopListController {
    
}

// MARK: CPTopListViewDelegate
extension CPTopListController: CPTopListViewDelegate {

}
