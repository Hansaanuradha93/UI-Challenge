import UIKit

protocol NavigationButtonPressedDelegate {
    func onButtonPress(backPressed: Bool)
}

class UCNavigationBarView: UIView {
    
    // MARK: Properties
    var title: String?
    var masterView: UCNavigationBarView!
    var delegate: NavigationButtonPressedDelegate?
    
    
    // MARK: IBOutlets
    @IBOutlet weak var leftArrowImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var locationImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var notificationImageView: UIImageView!
    @IBOutlet weak var profileImageView: UIImageView!
    

    // MARK: Initializers
    override init(frame: CGRect) { super.init(frame: frame) }
    
    
    required init?(coder: NSCoder) { super.init(coder: coder) }
    
    
    convenience init(frame: CGRect, title: String?, delegate: NavigationButtonPressedDelegate) {
        self.init(frame: frame)
        let view = Bundle.main.loadNibNamed("UCNavigationBarView", owner: self, options: nil)?.first as! UCNavigationBarView
        view.frame = frame
        titleLabel.text = title
        self.delegate = delegate
        masterView = view
        self.addSubview(view)
    }
    
    
    // MARK: IBActions
    @IBAction func leftArrowButtonTapped(_ sender: Any) {
        delegate?.onButtonPress(backPressed: true)
    }
    
    
    @IBAction func navigationButtonTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0:
            print("Go to location")
        case 1:
            print("Go to Search")
        case 2:
            print("Go to Notification")
        case 3:
            print("Go to Profile")
        default:
            break
        }
    }
}
