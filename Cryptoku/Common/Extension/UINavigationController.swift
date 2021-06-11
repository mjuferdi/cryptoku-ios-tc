//
//  UINavigationController.swift
//  Cryptoku
//
//  Created by Mario MJ on 11.06.21.
//

import UIKit

extension UINavigationController {
    
    var previousController: UIViewController? {
        return self.viewControllers.last { $0 != self.topViewController }
    }
    
}

extension UINavigationController {
    
    var topAsTabBarController: UITabBarController? {
        return self.topViewController as? UITabBarController
    }
    var topAsTabBarNavigationController: UINavigationController? {
        return self.topAsTabBarController?.selectedViewController as? UINavigationController
    }
    var topOfTabBarNavigationController: UIViewController? {
        if let tabBarNavigationController = self.topAsTabBarNavigationController {
            return tabBarNavigationController.topViewController
        } else {
            return self.topViewController
        }
    }

    func pushByTabBarNavigationController(_ destinationViewController: UIViewController, animated: Bool) {
        if let tabBarNavigationController = self.topAsTabBarNavigationController {
            tabBarNavigationController.tabBarController?.tabBar.isHidden = true
            tabBarNavigationController.pushViewController(destinationViewController, animated: animated)
        } else {
            self.pushViewController(destinationViewController, animated: animated)
        }
    }

    @discardableResult
    func popByTabBarNavigationController(animated: Bool) -> UIViewController? {
        if let tabBarNavigationController = self.topAsTabBarNavigationController {
            return tabBarNavigationController.popViewController(animated: true)
        } else {
            return self.popViewController(animated: true)
        }
    }

    @discardableResult
    func popByTabBarNavigationController(to viewController: AnyClass, animated: Bool) -> [UIViewController]? {
        if let tabBarNavigationController = self.topAsTabBarNavigationController,
           let destinationViewController = tabBarNavigationController.viewControllers.first(where: {
            return $0.isKind(of: viewController)
           }) {
            return tabBarNavigationController.popToViewController(destinationViewController, animated: animated)
        }

        if let destinationViewController = self.viewControllers.first(where: { $0.isKind(of: viewController) }) {
            return self.popToViewController(destinationViewController, animated: animated)
        }

        return nil
    }
    
    @discardableResult
    func popRootByTabBarNavigationController(animated: Bool) -> [UIViewController]? {
        if let tabBarNavigationController = self.topAsTabBarNavigationController {
            return tabBarNavigationController.popToRootViewController(animated: true)
        } else {
            return self.popToRootViewController(animated: true)
        }
    }
    
    func presentByTopOfTabBarNavigationController(
        _ viewController: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        if let topOfTabBarNavigationController = self.topOfTabBarNavigationController {
            topOfTabBarNavigationController.present(viewController, animated: animated, completion: completion)
        } else {
            self.topViewController?.present(viewController, animated: animated, completion: completion)
        }
    }

}
