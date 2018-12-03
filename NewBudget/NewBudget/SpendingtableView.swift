import UIKit
//protocol ChangesongDelegate: class {
//    func SongTitleChanged(newTitle: String, index: Int)
//}
class Spendingtableview: UITableViewCell{
    
    var nameLabel: UILabel!
    var artLabel: UILabel!
    var ImageView: UIImageView!
    var albLabel: UILabel!
    
    let padding: CGFloat = 10
    let labelHeight: CGFloat = 20
    let heartImageWidth: CGFloat = 60
    let heartImageHeight: CGFloat = 60
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel = UILabel()
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.textColor = .white
        nameLabel.font = UIFont.systemFont(ofSize: 18)
        
        artLabel = UILabel()
        artLabel.translatesAutoresizingMaskIntoConstraints = false
        artLabel.textColor = .white
        artLabel.font = UIFont.systemFont(ofSize: 14)
        
        albLabel = UILabel()
        albLabel.translatesAutoresizingMaskIntoConstraints = false
        albLabel.textColor = .white
        albLabel.font = UIFont.systemFont(ofSize: 14)
        
        
        contentView.addSubview(nameLabel)
        contentView.addSubview(artLabel)
        contentView.addSubview(albLabel)
        contentView.backgroundColor = .darkGray
        
        
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
            nameLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
            nameLabel.heightAnchor.constraint(equalToConstant: labelHeight)
            ])
        
        NSLayoutConstraint.activate([
            artLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor),
            artLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor),
            artLabel.heightAnchor.constraint(equalTo: nameLabel.heightAnchor)
            ])
        
        NSLayoutConstraint.activate([
            albLabel.leadingAnchor.constraint(equalTo: artLabel.leadingAnchor),
            albLabel.topAnchor.constraint(equalTo: artLabel.bottomAnchor),
            albLabel.heightAnchor.constraint(equalTo: artLabel.heightAnchor)
            ])
        
        
        super.updateConstraints()
    }
    
    func configure(for spt: Spending) {
        nameLabel.text = spt.name
        
        
        
    }
    
    
    
    
    
    
    
    // MARK: - Private Helpers
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
//extension UITableView: ChangesongTitleDelegate {
//    func SongTitleChanged(newTitle: String, index: Int) {
//      //  Songs[index].name = newTitle
//    }
//
//}
