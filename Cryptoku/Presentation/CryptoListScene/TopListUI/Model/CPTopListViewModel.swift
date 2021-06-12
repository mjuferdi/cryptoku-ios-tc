//
//  CPTopListViewModel.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//  Copyright (c) 2021 All rights reserved.

import Alamofire
import UIKit

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
    var startCryptoListFlow: ((_ instructor: CryptoListFlowCoordinatorInstructor) -> Void)
}

// MARK: CPTopListViewModelInput
protocol CPTopListViewModelInput {
    func fetchTopListCryptoCurrency()
    func showCurrencyNews(categories: String)
    func showAllertMessage(to viewController: UIViewController)
    func viewDidLoad()
}

// MARK: CPTopListViewModelOutput
protocol CPTopListViewModelOutput {
    var displayedAllertMessage: Observable<Bool> { get }
    var displayedToplist: Observable<ToplistTopTierDomain?> { get }
    var displayedLoadingState: Observable<Bool> { get }
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
    let fetchTopListCryptoCurrencyUseCase: FetchTopListCryptoCurrencyUseCase


    // MARK: Common Variable
    var errorMessage: String = ""
    

    // MARK: Output ViewModel
    let displayedAllertMessage = Observable<Bool>(false)
    let displayedToplist = Observable<ToplistTopTierDomain?>(nil)
    let displayedLoadingState = Observable<Bool>(false)

    // MARK: Init Function
    init(requestValue: CPTopListViewModelRequestValue,
         route: CPTopListViewModelRoute,
         fetchTopListCryptoCurrencyUseCase: FetchTopListCryptoCurrencyUseCase) {
        self.requestValue = requestValue
        self.route = route
        self.fetchTopListCryptoCurrencyUseCase = fetchTopListCryptoCurrencyUseCase
    }
    
}

// MARK: Input ViewModel
extension DefaultCPTopListViewModel {
    
    func fetchTopListCryptoCurrency() {
        let parameter: [String: Any] = [
            "tsym": "USD",
            "limit": 50
        ]
        let request = FetchTopListCryptoCurrencyUseCaseRequest(parameter: parameter)
        self.fetchTopListCryptoCurrencyUseCase.execute(request) { [unowned self] (result) in
            switch result {
            case .success(let response):
                self.displayedToplist.value = response.topList
            case .failure(let error):
                self.displayedAllertMessage.value = true
                self.errorMessage = error.localizedDescription
            }
            self.displayedLoadingState.value = true
        }
    }
    
    func showCurrencyNews(categories: String) {
        let requestValue = CPNewsViewModelRequestValue(categories: categories)
        let instructor = CryptoListFlowCoordinatorInstructor.presentNewsUI(requestValue: requestValue)
        self.route.startCryptoListFlow(instructor)
        
    }
    
    func showAllertMessage(to viewController: UIViewController) {
        viewController.showAllertMessage(.error, title: "", body: self.errorMessage, cornerRadius: 10, completion: nil)
    }
    
    func viewDidLoad() {
        self.fetchTopListCryptoCurrency()
    }
}
