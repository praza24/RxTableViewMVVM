import Foundation
import UIKit

protocol Coordinator {
  func start()
}

class AppCoordinator: Coordinator {
    
    private let window: UIWindow

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        let startVC = ViewController.instantiate(with: RestauarantsListViewModel())
        let navigationController = UINavigationController(rootViewController: startVC)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
