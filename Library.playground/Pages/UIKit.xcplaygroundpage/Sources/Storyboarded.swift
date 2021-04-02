//
//  Storyboarded.swift
//
//  Created by Rohan Ramsay on 14/03/21.
//

import UIKit

protocol Storyboarded {
    static func instantiate() -> Self
    static var storyboardName: String {get}
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}
