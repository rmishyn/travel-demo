//
//  UIViewController+Extension.swift
//  Travel
//
//  Created by Ruslan Mishyn on 09.06.2024.
//

import UIKit

extension UIViewController {
    
    /// Bottom inset used to determine the safe area for this view
    var bottomSafeArea: CGFloat { view.safeAreaInsets.bottom }
    
    /// Top inset used to determine the safe area for this view
    var topSafeArea: CGFloat { view.safeAreaInsets.top }
    
    var topBarHeight: CGFloat {
        if #available(iOS 13, *) {
            return (view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0.0) +
                (self.navigationController?.navigationBar.frame.height ?? 0.0)
        } else {
            return navigationController?.navigationBar.frame.size.height ?? 0.0
        }
    }
    
    /// Creates the view controller with the specified identifier and initializes it with the data from the storyboard
    /// - Parameters:
    ///   - storyboard: Storyboard containing this view controller definition
    ///   - identifier: An identifier string that uniquely identifies the view controller in the storyboard file
    /// - Returns: View controller loaded from storyboard
    private class func instantiateControllerInStoryboard<T: UIViewController>(_ storyboard: UIStoryboard, identifier: String) -> T {
        storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
    /// Creates the view controller with the specified identifier and initializes it with the data from the storyboard
    /// - Parameters:
    ///   - storyboard: Storyboard containing this view controller definition
    ///   - identifier: An identifier string that uniquely identifies the view controller in the storyboard file
    /// - Returns: View controller loaded from storyboard
    class func controllerInStoryboard(_ storyboard: UIStoryboard, identifier: String) -> Self {
        instantiateControllerInStoryboard(storyboard, identifier: identifier)
    }
    
    /// Creates the view controller with the default identifier and initializes it with the data from the storyboard
    /// - Parameters:
    ///   - storyboard: Storyboard enumeration case containing this view controller definition
    /// - Returns: View controller loaded from storyboard
    class func controllerFromStoryboard(_ storyboard: Storyboard) -> Self {
        controllerInStoryboard(UIStoryboard(name: storyboard.rawValue, bundle: nil), identifier: identifier)
    }
}
