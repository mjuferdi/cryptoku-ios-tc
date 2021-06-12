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
    func fetchNewsFeed(by categories: String)
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
    let fetchNewsFeedByCategoriesUseCase: FetchNewsFeedByCategoriesUseCase


    // MARK: Common Variable

    

    // MARK: Output ViewModel
    

    // MARK: Init Function
    init(requestValue: CPNewsViewModelRequestValue,
         route: CPNewsViewModelRoute,
         fetchNewsFeedByCategoriesUseCase: FetchNewsFeedByCategoriesUseCase) {
        self.requestValue = requestValue
        self.route = route
        self.fetchNewsFeedByCategoriesUseCase = fetchNewsFeedByCategoriesUseCase
    }
    
}

// MARK: Input ViewModel
extension DefaultCPNewsViewModel {
    
    func doCloseNewsFeed() {
        self.route.dismiss()
    }
    
    func fetchNewsFeed(by categories: String) {
        let parameter: [String: Any] = [
            "lang": "EN",
            "categories": categories
        ]
        let request = FetchNewsFeedByCategoriesUseCaseRequest(parameter: parameter)
        self.fetchNewsFeedByCategoriesUseCase.execute(request) { (result) in
            switch result {
            case .success(let response):
                print("NEIN", response.newsFeed)
            case .failure(let error):
                print("NEIN", error)
                //self.displayedAllertMessage.value = true
                //self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func viewDidLoad() {
        self.fetchNewsFeed(by: self.requestValue.categories)
    }
    
}
