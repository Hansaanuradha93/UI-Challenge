import UIKit

class SmallTableCell: UICollectionViewCell, SelfConfiguringCell {
    
    static let reuseIdentifier: String = "SmallTableCell"
    
    private let nameLabel = UILabel()
    private let imageView = UIImageView()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        nameLabel.textColor = .label
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let stackView = UIStackView(arrangedSubviews: [imageView, nameLabel])
        stackView.alignment = .center
        stackView.spacing = 20

        contentView.addSubview(stackView)
        stackView.fillSuperview()
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    func configure(with app: App) {
        nameLabel.text = app.name
        imageView.image = UIImage(named: app.image)
    }
}
