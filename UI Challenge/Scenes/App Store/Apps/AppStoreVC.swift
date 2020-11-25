import UIKit

class AppStoreVC: UIViewController {
    
    // MARK: Properties
    private let sections = Bundle.main.decode([Section].self, from: "appstore.json")
    private var dataSource: UICollectionViewDiffableDataSource<Section, App>?
    
    private var collectionView: UICollectionView!

    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
}


// MARK: - Private Methods
extension AppStoreVC {
    
    func setupViews() {
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Apps"
        
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UICollectionViewFlowLayout())
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .systemBackground
        view.addSubview(collectionView)
    }
}
