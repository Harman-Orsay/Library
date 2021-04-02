import UIKit

public extension UIView {
    
    func pinToSuperview() {
        guard superview != nil else {fatalError()}
        let HConstraints = NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|",
                                                          options: .alignAllCenterY,
                                                          metrics: nil,
                                                          views: ["view" : self])
        let VConstraints = NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|",
                                                          options: .alignAllCenterX,
                                                          metrics: nil,
                                                          views: ["view" : self])
        NSLayoutConstraint.activate(HConstraints + VConstraints)
    }
}

