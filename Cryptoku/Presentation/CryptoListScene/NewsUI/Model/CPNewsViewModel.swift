//
//  CPNewsViewModel.swift
//  Cryptoku
//
//  Created by Mario MJ on 13.06.21.
//  Copyright (c) 2021 All rights reserved.

import UIKit

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
    func showAllertMessage(to viewController: UIViewController)
    func viewDidLoad()

}

// MARK: CPNewsViewModelOutput
protocol CPNewsViewModelOutput {
    var displayedAllertMessage: Observable<Bool> { get }
    var displayedNews: Observable<NewsDomain?> { get }
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
    var errorMessage: String = ""
    

    // MARK: Output ViewModel
    let displayedAllertMessage = Observable<Bool>(false)
    let displayedNews = Observable<NewsDomain?>(nil)


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
                self.displayedNews.value = response.newsFeed
            case .failure(let error):
                self.displayedAllertMessage.value = true
                self.errorMessage = error.localizedDescription
            }
        }
    }
    
    func showAllertMessage(to viewController: UIViewController) {
        viewController.showAllertMessage(.error, title: "", body: self.errorMessage, cornerRadius: 10, completion: nil)
    }
    
    func viewDidLoad() {
        self.fetchNewsFeed(by: self.requestValue.categories)
    }
    
}
