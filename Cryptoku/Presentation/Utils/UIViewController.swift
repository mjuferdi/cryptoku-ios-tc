//
//  UIViewController.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import UIKit
import SwiftMessages

extension UIViewController {
    
    // MARK: Show custom allert message
    func showAllertMessage(_ theme: Theme, title: String, body: String, cornerRadius: CGFloat, hideButton: Bool = true, completion: (() -> ())? = nil) {
        let view = MessageView.viewFromNib(layout: .cardView)
        view.configureTheme(theme)
        view.configureDropShadow()
        view.configureContent(title: title, body: body)
        view.layoutMarginAdditions = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
        (view.backgroundView as? CornerRoundingView)?.cornerRadius = cornerRadius
        view.button?.isHidden = hideButton
        SwiftMessages.show(view: view)
        if completion != nil {
            completion!()
        }
    }
    
}
