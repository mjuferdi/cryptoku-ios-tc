//
//  CPNewsViewModel.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//  Copyright (c) 2021 All rights reserved.

import Foundation

// MARK: CPNewsViewModelResponse
enum CPNewsViewModelResponse {
}

// MARK: CPNewsViewModelDelegate
protocol CPNewsViewModelDelegate: class {
}

// MARK: CPNewsViewModelRequestValue
struct CPNewsViewModelRequestValue {
    let categories: String
}

// MARK: CPNewsViewModelRoute
struct CPNewsViewModelRoute {
    var dismiss: (() -> Void)
}

// MARK: CPNewsViewModelInput
protocol CPNewsViewModelInput {
    func doCloseNewsFeed()
    func viewDidLoad()

}

// MARK: CPNewsViewModelOutput
protocol CPNewsViewModelOutput {

}

// MARK: CPNewsViewModel
protocol CPNewsViewModel: CPNewsViewModelInput, CPNewsViewModelOutput { }

// MARK: DefaultCPNewsViewModel
final class DefaultCPNewsViewModel: CPNewsViewModel {

    // MARK: DI Variable
    weak var delegate: CPNewsViewModelDelegate?
    let requestValue: CPNewsViewModelRequestValue
    let route: CPNewsViewModelRoute

    // MARK: UseCase Variable



    // MARK: Common Variable

    

    // MARK: Output ViewModel
    

    // MARK: Init Function
    init(requestValue: CPNewsViewModelRequestValue,
         route: CPNewsViewModelRoute) {
        self.requestValue = requestValue
        self.route = route
    }
    
}

// MARK: Input ViewModel
extension DefaultCPNewsViewModel {
    
    func doCloseNewsFeed() {
        self.route.dismiss()
    }
    func viewDidLoad() {
        print("NEIN", self.requestValue.categories)
    }
    
}
