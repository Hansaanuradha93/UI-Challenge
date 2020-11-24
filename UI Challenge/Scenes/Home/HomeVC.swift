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
    
    private var collectionView: UICollectionView!
    
    private static let cellIdentifier = "Cell"
    private static let categoryIdentifier = "categoryIdentifier"
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - UICollectionViewDataSource
extension HomeVC: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 8
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVC.cellIdentifier, for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
}


// MARK: Private Methods
private extension HomeVC {
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            
            if sectionNumber == 0 {
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 2
                item.contentInsets.bottom = 16
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
            } else {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.25), heightDimension: .absolute(150))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(500))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets.leading = 16
                
                section.boundarySupplementaryItems = [
                    .init(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: categoryIdentifier, alignment: .topLeading)
                ]
                
                return section
            }
            
            
        }
        
        return layout
    }
    
    
    func setupUI() {
        navigationController?.navigationBar.isHidden = true
        navigationBarView.addSubview(customNavigationBarView)
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: HomeVC.createLayout())
        collectionView.backgroundColor = .systemBackground
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: HomeVC.cellIdentifier)
        
        view.addSubview(collectionView)
        collectionView.anchor(top: navigationBarView.bottomAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
    }
}


// MARK: - NavigationButtonPressedDelegate
extension HomeVC: NavigationButtonPressedDelegate {
    
    func onButtonPress(backPressed: Bool) {
        print("Back button pressed")
    }
}
