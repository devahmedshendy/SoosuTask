//
//  UITabBarController+Extension.swift
//  Soosu
//
//  Created by Ahmed Shendy on 26/02/2024.
//

import SwiftUI

/// Source: https://medium.com/@cleberwdsantos/swiftui-tip-tab-bar-with-rounded-corners-and-shadow-1c520dda31a
extension UITabBarController {
    private static let ShadowIdentifier: String = "TabBarShadow"
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()

        tabBar.layer.masksToBounds = true
        tabBar.layer.cornerRadius = 30
        
        // Choose with corners should be rounded
        tabBar.layer.maskedCorners = [
            .layerMinXMinYCorner, .layerMaxXMinYCorner
        ] // top left, top right

        // Uses `accessibilityIdentifier` in order to retrieve shadow view if already added
        if let shadowView = view.subviews.first(where: { $0.accessibilityIdentifier == Self.ShadowIdentifier }) {
            shadowView.frame = tabBar.frame.insetBy(dx: 0, dy: -15)
        } else {
            let shadowView = UIView(frame: .zero)
            shadowView.frame = tabBar.frame.insetBy(dx: 0, dy: -15)
            shadowView.accessibilityIdentifier = Self.ShadowIdentifier
            shadowView.backgroundColor = UIColor.white
            shadowView.layer.cornerRadius = tabBar.layer.cornerRadius
            shadowView.layer.maskedCorners = tabBar.layer.maskedCorners
            shadowView.layer.masksToBounds = false
            shadowView.layer.shadowColor = Color.accentColor.cgColor
            shadowView.layer.shadowOffset = CGSize(width: 0.0, height: -4.0)
            shadowView.layer.shadowOpacity = 0.1
            shadowView.layer.shadowRadius = 10
            
            view.addSubview(shadowView)
            view.bringSubviewToFront(tabBar)
        }
    }
}
