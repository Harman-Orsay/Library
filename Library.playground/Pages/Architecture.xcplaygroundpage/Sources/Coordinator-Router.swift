//
//  Router.swift
//
//  Created by Rohan Ramsay on 8/03/21.
//

import UIKit

public protocol Coordinator1: class {
    func start()
    func stop()
}

public protocol Router: class {
    func present(_ viewController: UIViewController, animated: Bool)
    func present(_ viewController: UIViewController, animated: Bool, onDismiss: (()->Void)?)
    func dismiss(animated: Bool)
}

extension Router {
    public func present(_ viewController: UIViewController, animated: Bool) {
        present(viewController, animated: animated, onDismiss: nil)
    }
}


//MARK: - Rejected vaiations

public protocol Coordinator2: class {
  var children: [Coordinator2] { get set }
  var router: Router { get }
  
  func present(animated: Bool, onDismissed: (()->Void)?)
  func dismiss(animated: Bool)
  
  func presentChild(_ child: Coordinator2, animated: Bool)
  func presentChild(_ child: Coordinator2, animated: Bool, onDismissed: (()->Void)?)
}
//Too much implementation detail -- router, children, present child -- why expose these?
