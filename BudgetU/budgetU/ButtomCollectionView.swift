import UIKit

class ButtomCollectionView: UICollectionViewCell {
    
    // var buttom: UIButton!
    var label: UILabel!
    var label2 : UILabel!
    var change: Bool!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        change = Bool()
        change = false
        label = UILabel()
        label.text = "hi"
        label.backgroundColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        
        label2 = UILabel()
        label2.text = "hi"
        label2.backgroundColor = .white
        label2.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        // contentView.addSubview(buttom)
        contentView.addSubview(label)
        contentView.addSubview(label2)
        
    }
    
    override func updateConstraints() {
        
        
        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            label.heightAnchor.constraint(equalTo: contentView.heightAnchor),
            label.widthAnchor.constraint(equalTo: contentView.widthAnchor),
            
            ])
        
        NSLayoutConstraint.activate([
            label2.topAnchor.constraint(equalTo: contentView.topAnchor),
            label2.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label2.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label2.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
            ])
        
        super.updateConstraints()
    }
    
    func configure(for but: buttom) {
        label.text = but.buttomname
        label.font = UIFont(name: label.font.fontName, size: 10)
        label2.text = but.selected
        label.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        label2.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        label.textAlignment = .center
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
