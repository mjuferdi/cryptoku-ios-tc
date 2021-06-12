//
//  AppDelegate.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {


    lazy var navigationController: UINavigationController = {
        let controller = UINavigationController()
        controller.hidesBottomBarWhenPushed = false
        controller.setNavigationBarHidden(true, animated: false)
        return controller
    }()
    lazy var appDIContainer: AppDIContainer = {
        return AppDIContainer(navigationController: self.navigationController)
    }()
    lazy var appFlowCoordinator: AppFlowCoordinator = {
        return AppFlowCoordinator(
            navigationController: self.navigationController,
            presenationFactory: self.appDIContainer,
            useCaseFactory: self.appDIContainer)
    }()
    
    var appFlowCoordinatorInstructor: AppFlowCoordinator.Instructor?
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame:  UIScreen.main.bounds)
        window?.backgroundColor = .white
        window?.rootViewController = self.navigationController
        window?.makeKeyAndVisible()
        self.appFlowCoordinatorInstructor = .main
        if let appFlowCoordinatorInstructor = self.appFlowCoordinatorInstructor {
            self.appFlowCoordinator.start(with: appFlowCoordinatorInstructor)
            self.appFlowCoordinatorInstructor = nil
        }
        
        return true
    }

}

