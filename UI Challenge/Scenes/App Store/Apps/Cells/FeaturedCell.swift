import UIKit

class FeaturedCell: UICollectionViewCell, SelfConfiguringCell {
    
    static var reuseIdentifier: String = "FeaturedCell"
    
    let taglineLabel = UILabel()
    let nameLabel = UILabel()
    let subtitleLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        taglineLabel.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 12, weight: .bold))
        taglineLabel.textColor = .systemBlue
        
        nameLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        nameLabel.textColor = .label
        
        subtitleLabel.font = UIFont.preferredFont(forTextStyle: .title2)
        subtitleLabel.textColor = .secondaryLabel
        
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        
        let stackView = UIStackView(arrangedSubviews: [taglineLabel, nameLabel, subtitleLabel, imageView])
        stackView.axis = .vertical
        contentView.addSubview(stackView)
        stackView.fillSuperview()
        
        stackView.setCustomSpacing(10, after: subtitleLabel)
    }
    
    
    required init?(coder: NSCoder) { fatalError() }
    
    
    func configure(with app: App) {
        taglineLabel.text = app.tagline.uppercased()
        nameLabel.text = app.name
        subtitleLabel.text = app.subheading
        imageView.image = UIImage(named: app.image)
    }
}
