//
//  AppRouter.swift
//
//  Created by Rohan Ramsay on 8/03/21.
//

import UIKit

public class AppRouter: Router {
    public unowned let window: UIWindow
    
    public init(window: UIWindow) {
        self.window = window
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismiss: (() -> Void)?) {
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
    
    public func dismiss(animated: Bool) {}
}
