/*
import UIKit

public class SplitViewCoordinator {
    
    let mainChild: Coordinator
    let detailChild: Coordinator?
    
    //most likely navigation controllers
    let mainRootViewController: UIViewController?
    let detailsRootViewController: UIViewController?
    
    let router: Router
    let rootViewController: UISplitViewController?

    init(router: Router) {
        self.router = router
        self.rootViewController = UISplitViewController()
    }
    
    func makeMainCoordinator() -> Coordinator {
        //use mainRootViewController to instantiate / setup the Router for main coordinator
    }
    
    func makeDetailCoordinator() -> Coordinator {
        //use detailsRootViewController to instantiate / setup the Router for details coordinator
    }
    
}

extension SplitViewCoordinator: Coordinator {
    
    func start() {
        router.present(rootViewController)
        mainChild.start()
        
        //check if split
        //detailChild.start()
    }
    
    func stop() {
        
    }
}

extension SplitViewCoordinator: UISplitViewControllerDelegate {
    //manipulate what's displayed where
}
*/
