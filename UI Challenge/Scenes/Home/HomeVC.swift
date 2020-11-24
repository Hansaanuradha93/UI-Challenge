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
        let view = UCNavigationBarView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: self.navigationBarView.frame.size.height), title: "Life Styles", delegate: self)
        return view
    }()
    
    private let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    private let cellIdentifier = "Cell"
    
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - UICollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
}


// MARK: Private Methods
private extension HomeVC {
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        navigationBarView.addSubview(customNavigationBarView)
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .systemBackground
        collectionView.anchor(top: navigationBarView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellIdentifier)
    }
}


// MARK: - NavigationButtonPressedDelegate
extension HomeVC: NavigationButtonPressedDelegate {
    
    func onButtonPress(backPressed: Bool) {
        print("Back button pressed")
    }
}
