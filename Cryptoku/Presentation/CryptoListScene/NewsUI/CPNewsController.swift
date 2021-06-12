//
//  CPNewsController.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//  Copyright (c) 2021 All rights reserved.

import UIKit

// MARK: CPNewsController
final class CPNewsController: UIViewController {

    // MARK: DI Variable
    lazy var _view: CPNewsView = DefaultCPNewsView()
    var viewModel: CPNewsViewModel!

    // MARK: Common Variable


    // MARK: Create Function
    class func create(with viewModel: CPNewsViewModel) -> CPNewsController {
        let controller = CPNewsController()
        controller.viewModel = viewModel
        return controller
    }

    // MARK: UIViewController Function
    override func loadView() {
        self.view = (self._view as! UIView)
        self._view.delegate = self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.bind(to: self.viewModel)
        self.viewModel.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self._view.viewWillAppear(navigationBar: self.navigationController?.navigationBar,
                                  navigationItem: self.navigationItem,
                                  tabBarController: self.tabBarController)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self._view.viewWillDisappear()
    }

    // MARK: Bind ViewModel Function
    private func bind(to viewModel: CPNewsViewModel) {
    }
    
}

// MARK: Observe ViewModel Function
extension CPNewsController {
    
}

// MARK: CPNewsViewDelegate
extension CPNewsController: CPNewsViewDelegate {
    func closeview() {
        self.viewModel.doCloseNewsFeed()
    }
}
