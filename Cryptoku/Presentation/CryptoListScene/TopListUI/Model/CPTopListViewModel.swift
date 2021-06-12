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
}

// MARK: CPTopListViewModelInput
protocol CPTopListViewModelInput {
    func fetchTopListCryptoCurrency()
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
    let fetchTopListCryptoCurrencyUseCase: FetchTopListCryptoCurrencyUseCase


    // MARK: Common Variable

    

    // MARK: Output ViewModel
    

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
            "page": 1
        ]
        let request = FetchTopListCryptoCurrencyUseCaseRequest(parameter: parameter)
        self.fetchTopListCryptoCurrencyUseCase.execute(request) { (result) in
            switch result {
            case .success(let response):
                print("NEIN" , response)
            case .failure(let error):
                print("NEIN" , error.localizedDescription)
            }
        }
    }
    
    func viewDidLoad() {
        self.fetchTopListCryptoCurrency()
    }
}
