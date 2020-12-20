import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let sceneWindow = (scene as? UIWindowScene) else { return }
       
        self.window = UIWindow(windowScene: sceneWindow)
        appCoordinator = AppCoordinator(window: window!)
        appCoordinator?.start()
    }
}

