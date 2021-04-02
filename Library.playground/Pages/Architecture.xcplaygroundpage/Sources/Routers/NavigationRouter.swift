//
//  NavigationRouter.swift
//
//  Created by Rohan Ramsay on 8/03/21.
//

import UIKit

public class NavigationRouter: NSObject, Router {
    fileprivate let navigationController: UINavigationController
    fileprivate let routerRootController: UIViewController?
    fileprivate var onDismissForViewController: [UIViewController: (()->Void)] = [:]
    
    public init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.routerRootController = navigationController.viewControllers.first
        super.init()
        self.navigationController.delegate = self
    }
    
    public func present(_ viewController: UIViewController,
                        animated: Bool,
                        onDismiss: (()->Void)?) {
        onDismissForViewController[viewController] = onDismiss
        navigationController.pushViewController(viewController, animated: animated)
    }
    
    public func dismiss(animated: Bool) {
        guard let routerRootController = routerRootController else {
            navigationController.popToRootViewController(animated: animated)
            return
        }
        performOnDismissed(for: routerRootController)
        navigationController.popToViewController(routerRootController, animated: animated)
    }
    
    fileprivate func performOnDismissed(for viewController: UIViewController) {
        guard let onDismiss = onDismissForViewController[viewController] else {
            return
        }
        onDismiss()
        onDismissForViewController[viewController] = nil
    }
}

extension NavigationRouter: UINavigationControllerDelegate {
    public func navigationController(_ navigationController: UINavigationController,
                                     didShow viewController: UIViewController,
                                     animated: Bool) {
        guard let dismissedViewController =
                navigationController.transitionCoordinator?.viewController(forKey: .from),
              !navigationController.viewControllers.contains(dismissedViewController) else {
            return
        }
        performOnDismissed(for: dismissedViewController)
    }
}

public class ModalNavigationRouter: NavigationRouter {
    public unowned let parentViewController: UIViewController
    
    public init(parentViewController: UIViewController) {
        self.parentViewController = parentViewController
        super.init(navigationController: UINavigationController())
    }
    
    public override func present(_ viewController: UIViewController, animated: Bool, onDismiss: (() -> Void)?) {
        onDismissForViewController[viewController] = onDismiss
        if navigationController.viewControllers.count == 0 {
            presentModally(viewController, animated: animated)
        } else {
            navigationController.pushViewController(viewController, animated: animated)
        }
    }
    
    public override func dismiss(animated: Bool) {
        performOnDismissed(for: navigationController.viewControllers.first!)
        parentViewController.dismiss(animated: animated, completion: nil)
    }
    
    private func presentModally(_ viewController: UIViewController, animated: Bool) {
        addCancelButton(to: viewController)
        navigationController.setViewControllers([viewController], animated: false)
        parentViewController.present(navigationController, animated: animated, completion: nil)
    }
    
    private func addCancelButton(to viewController: UIViewController) {
        viewController.navigationItem.leftBarButtonItem =
            UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(cancelPressed))
    }
    
    @objc private func cancelPressed() {
        performOnDismissed(for: navigationController.viewControllers.first!)
        dismiss(animated: true)
    }
}
