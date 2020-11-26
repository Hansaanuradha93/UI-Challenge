import UIKit

class MediumTableViewCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "MediumTableViewCell"
    
    private let nameLabel = UILabel()
    private let subtitileLabel = UILabel()
    private let imageView = UIImageView()
    private let buyButton = UIButton(type: .custom)
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        nameLabel.textColor = .label
        
        subtitileLabel.font = UIFont.preferredFont(forTextStyle: .subheadline)
        subtitileLabel.textColor = .secondaryLabel
        
        imageView.layer.cornerRadius = 15
        imageView.clipsToBounds = true
        
        buyButton.setImage(Asserts.arrowDown, for: .normal)
        
        imageView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        buyButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        
        let innerStackView = UIStackView(arrangedSubviews: [nameLabel, subtitileLabel])
        innerStackView.axis = .vertical
        
        let outerStackView = UIStackView(arrangedSubviews: [imageView, innerStackView, buyButton])
        outerStackView.alignment = .center
        outerStackView.spacing = 10
        
        contentView.addSubview(outerStackView)
        outerStackView.anchor(top: contentView.topAnchor, leading: contentView.leadingAnchor, bottom: nil, trailing: contentView.trailingAnchor)
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    func configure(with app: App) {
        nameLabel.text = app.name
        subtitileLabel.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
}
