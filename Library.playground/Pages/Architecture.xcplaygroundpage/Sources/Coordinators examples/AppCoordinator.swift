/*
import UIKit
import TheAppKit

class AppCoordinator {
    
    private let router: Router
    private let appKitInterface: AppKitInterface
    
    private var child: Coordinator? //if multiple flows possible then make it an array
    
    private lazy var rootNavigationController: UINavigationController = UINavigationController()
    private lazy var invoiceRepository: InvoiceRepository = appKitInterface.getInvoiceRepository()
    
    init(router: Router, appKitInterface: AppKitInterface) {
        self.router = router
        self.appKitInterface = appKitInterface
    }
        
    //MARK: - Factory
    
    func makeRootViewController() -> UIViewController {
        rootNavigationController
    }
    
    func makeRootCoordinator() -> Coordinator {
        InvoiceListCoordinator(router: NavigationRouter(navigationController: rootNavigationController),
                               repository: invoiceRepository)
    }
}

extension AppCoordinator: Coordinator {
    
    func start(onDismiss: (() -> Void)?) {
        router.present(makeRootViewController(), animated: true)
        
        child = makeRootCoordinator()
        child?.start()
    }
    
    func stop() {}
}

*/
