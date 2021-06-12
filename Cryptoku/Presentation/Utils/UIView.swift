//
//  UIView.swift
//  Cryptoku
//
//  Created by Mario MJ on 12.06.21.
//

import UIKit

public extension UIView {
    // MARK: - Make round with border
    func makeRound(borderColor: UIColor? = nil,
                   borderWidth: CGFloat = 1,
                   clipToBounds: Bool = true,
                   cornerRad: CGFloat = 4.0,
                   cornerEdges: CACornerMask = [.layerMinXMinYCorner,
                                                .layerMinXMaxYCorner,
                                                .layerMaxXMinYCorner,
                                                .layerMaxXMaxYCorner]) {
        self.clipsToBounds = clipToBounds
        self.layer.masksToBounds = true
        self.layer.cornerRadius = cornerRad
        
        if !cornerEdges.isEmpty {
            self.layer.maskedCorners = cornerEdges
        }
        
        guard borderColor != nil else { return }
        
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor?.cgColor
    }
    
    func makeCircle() {
        self.layer.masksToBounds = false
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }

}
