//
//  CPTopListViewModel.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//  Copyright (c) 2021 All rights reserved.

import Foundation

// MARK: CPTopListViewModelResponse
enum CPTopListViewModelResponse {
}

// MARK: CPTopListViewModelDelegate
protocol CPTopListViewModelDelegate: class {
}

// MARK: CPTopListViewModelRequestValue
struct CPTopListViewModelRequestValue {
}

// MARK: CPTopListViewModelRoute
struct CPTopListViewModelRoute {
}

// MARK: CPTopListViewModelInput
protocol CPTopListViewModelInput {

    func viewDidLoad()

}

// MARK: CPTopListViewModelOutput
protocol CPTopListViewModelOutput {

}

// MARK: CPTopListViewModel
protocol CPTopListViewModel: CPTopListViewModelInput, CPTopListViewModelOutput { }

// MARK: DefaultCPTopListViewModel
final class DefaultCPTopListViewModel: CPTopListViewModel {

    // MARK: DI Variable
    weak var delegate: CPTopListViewModelDelegate?
    let requestValue: CPTopListViewModelRequestValue
    let route: CPTopListViewModelRoute

    // MARK: UseCase Variable



    // MARK: Common Variable

    

    // MARK: Output ViewModel
    

    // MARK: Init Function
    init(requestValue: CPTopListViewModelRequestValue,
         route: CPTopListViewModelRoute) {
        self.requestValue = requestValue
        self.route = route
    }
    
}

// MARK: Input ViewModel
extension DefaultCPTopListViewModel {
    
    func viewDidLoad() {
    }
    
}
