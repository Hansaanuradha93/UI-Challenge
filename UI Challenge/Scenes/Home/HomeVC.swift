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
    private static let headerIdentifier = "headerIdentifier"
    
    
    // MARK: View Controller
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
}


// MARK: - UICollectionViewDataSource && UICollectionViewDelegate
extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HomeVC.headerIdentifier, for: indexPath) as! CategoryHeaderView
        return header
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 3
        case 1:
            return 8
        case 2:
            return 3
        case 3:
            return 6
        default:
            return 0
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeVC.cellIdentifier, for: indexPath)
        cell.backgroundColor = .systemRed
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = UIViewController()
        var color = UIColor()
        
        switch indexPath.section {
        case 0:
            color = .systemBlue
        case 1:
            color = .systemPurple
        case 2:
            color = .systemPink
        case 3:
            color = .systemTeal
        default:
            color = .systemBackground
        }
        
        controller.view.backgroundColor = color
        navigationController?.pushViewController(controller, animated: true)
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
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(200))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.orthogonalScrollingBehavior = .paging
                
                return section
            } else if sectionNumber == 1 {
                
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
            } else if sectionNumber == 2 {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 32
                item.contentInsets.bottom = 16
                
                let gruopSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.8), heightDimension: .absolute(115))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: gruopSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 0)
                section.orthogonalScrollingBehavior = .continuous
                
                return section
            } else {
                
                let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.5), heightDimension: .absolute(250))
                let item = NSCollectionLayoutItem(layoutSize: itemSize)
                item.contentInsets.trailing = 16
                item.contentInsets.bottom = 16
                
                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(600))
                let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
                
                let section = NSCollectionLayoutSection(group: group)
                section.contentInsets = .init(top: 16, leading: 16, bottom: 0, trailing: 0)

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
        collectionView.delegate = self
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: HomeVC.cellIdentifier)
        collectionView.register(CategoryHeaderView.self, forSupplementaryViewOfKind: HomeVC.categoryIdentifier, withReuseIdentifier: HomeVC.headerIdentifier)
        
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
