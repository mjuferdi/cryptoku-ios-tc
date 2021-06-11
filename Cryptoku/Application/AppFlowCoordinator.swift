//
//  AppFlowCoordinator.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import UIKit

class AppFlowCoordinator {
        
    // MARK: - Instructor Enum
    public enum Instructor {
        case main
    }
    
    // MARK: - DI Variable
    private let navigationController: UINavigationController
    private let flowCoordinatorFactory: FlowCoordinatorFactory
    private let useCaseFactory: UseCaseFactory
    
    init(
        navigationController: UINavigationController,
        presenationFactory: PresentationFactory,
        useCaseFactory: UseCaseFactory
    ) {
        self.navigationController = navigationController
        self.flowCoordinatorFactory = presenationFactory
        self.useCaseFactory = useCaseFactory
    }

    func start(with instructor: AppFlowCoordinator.Instructor) {
        switch instructor {
        case .main:
            self.showCryptoListScene()
        }
    }
    
    private func showCryptoListScene() {
        DispatchQueue.main.async {
            let requestValue = CPTopListViewModelRequestValue()
            let instructor = CryptoListFlowCoordinatorInstructor.pushToTopListUI(requestValue: requestValue)
            self.flowCoordinatorFactory.instantiateCryptoListFlowCoordinator().start(with: instructor)
        }
    }
    
}
