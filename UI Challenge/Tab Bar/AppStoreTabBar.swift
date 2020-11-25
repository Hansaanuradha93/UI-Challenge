import UIKit

class AppStoreTabBar: UITabBarController {

    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - Fileprivate Methods
fileprivate extension AppStoreTabBar {
    
    func createAppStoreNC() -> UINavigationController {
        let appStoreVC = AppStoreVC()
        appStoreVC.tabBarItem = UITabBarItem(title: "", image: Asserts.apps, selectedImage: Asserts.appsFill)
        return UINavigationController(rootViewController: appStoreVC)
    }
    
    
    func createGamesNC() -> UINavigationController {
        let gameVC = GameVC()
        gameVC.tabBarItem = UITabBarItem(title: "", image: Asserts.gameController, selectedImage: Asserts.gameControllerFill)
        return UINavigationController(rootViewController: gameVC)
    }
    
    
    func createArchadeNC() -> UINavigationController {
        let archadeVC = ArchadeVC()
        archadeVC.tabBarItem = UITabBarItem(title: "", image: Asserts.archade, selectedImage: Asserts.archadeFill)
        return UINavigationController(rootViewController: archadeVC)
    }
    
    
    func createSearchNC() -> UINavigationController {
        let searchVC = SearchVC()
        searchVC.tabBarItem = UITabBarItem(title: "", image: Asserts.search, selectedImage: Asserts.search)
        return UINavigationController(rootViewController: searchVC)
    }
    
    
    func setupUI() {
        UITabBar.appearance().tintColor = .black
        tabBar.barTintColor = .white
        viewControllers = [createAppStoreNC(), createGamesNC(), createArchadeNC(), createSearchNC()]
        
        let traits = [UIFontDescriptor.TraitKey.weight: UIFont.Weight.medium]
        var descriptor = UIFontDescriptor(fontAttributes: [UIFontDescriptor.AttributeName.family: Fonts.avenirNext])
        descriptor = descriptor.addingAttributes([UIFontDescriptor.AttributeName.traits: traits])
        let attributesForTitle = [NSAttributedString.Key.font: UIFont(descriptor: descriptor, size: 18)]
        let attributesForLargeTitle = [NSAttributedString.Key.font: UIFont(descriptor: descriptor, size: 28)]
        UINavigationBar.appearance().titleTextAttributes = attributesForTitle
        UINavigationBar.appearance().largeTitleTextAttributes = attributesForLargeTitle
        UINavigationBar.appearance().tintColor = .darkGray
    }
}
