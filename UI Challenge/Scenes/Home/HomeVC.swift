import UIKit

class HomeVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var navigationBarView: UIView!

    
    // MARK: Properties
    public class var storyboardName: String {
        return "Home"
    }
    
    static func create() -> HomeVC {
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: self))
        let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: HomeVC.self)) as? HomeVC
        return viewController!
    }
    
    lazy var customNavigationBarView: UCNavigationBarView = {
        let view = UCNavigationBarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.navigationBarView.frame.size.height), title: "Sign Up")
        return view
    }()
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        navigationBarView.addSubview(customNavigationBarView)
    }
}
