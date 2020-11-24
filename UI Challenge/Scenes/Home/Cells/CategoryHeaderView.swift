import UIKit

class CategoryHeaderView: UICollectionReusableView {
    
    private let titleLabel = UILabel()
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) { fatalError() }
}


// MARK: - Private Methods
private extension CategoryHeaderView {
    
    func setupUI() {
        titleLabel.text = "Category"
        
        addSubview(titleLabel)
        titleLabel.fillSuperview()
    }
}
