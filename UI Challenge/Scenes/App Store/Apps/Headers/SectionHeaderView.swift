import UIKit

class SectionHeaderView: UICollectionReusableView {
    
    static let reuseIdentifier = "SectionHeaderView"
    
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let seperator = UIView()
        seperator.backgroundColor = .quaternaryLabel
        
        titleLabel.font = UIFontMetrics.default.scaledFont(for: UIFont.systemFont(ofSize: 22, weight: .bold))
        titleLabel.textColor = .label
        
        subtitleLabel.textColor = .secondaryLabel
        
        let stackView = UIStackView(arrangedSubviews: [seperator, titleLabel, subtitleLabel])
        stackView.axis = .vertical
        addSubview(stackView)
        seperator.setHeight(1)
        stackView.fillSuperview(padding: .init(top: 0, left: 0, bottom: 0, right: 10))
        
        stackView.setCustomSpacing(10, after: seperator)
    }
    
    required init?(coder: NSCoder) { fatalError() }
}
