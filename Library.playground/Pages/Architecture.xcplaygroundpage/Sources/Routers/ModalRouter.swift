//
//  ModalRouter.swift
//
//  Created by Rohan Ramsay on 8/03/21.
//

import UIKit

public class ModalRouter: Router {
    private let parentViewController: UIViewController
    private var childViewController: UIViewController? = nil
    private var onDismiss: (()->Void)? = nil
    
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
    }
    
    public func present(_ viewController: UIViewController, animated: Bool, onDismiss: (() -> Void)?) {
        guard childViewController == nil else {
            fatalError("Router already presented a child") //or just return?
        }
        self.childViewController = viewController
        self.onDismiss = onDismiss
        parentViewController.present(viewController, animated: animated, completion: nil)
    }
    
    public func dismiss(animated: Bool) {
        childViewController?.dismiss(animated: animated, completion: onDismiss)
    }
}
