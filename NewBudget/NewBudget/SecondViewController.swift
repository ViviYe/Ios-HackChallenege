import UIKit

class SecondViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    
    let padding: CGFloat = 20
    
    let CatagoryReuseIdentifier: String = "CatagoriesCollectionViewCell"
    
    var catagories: [Catagories] = []
    
    
    
    var CatagoryCollectionView: UICollectionView!
    var heading : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        title = "Budget University"
        edgesForExtendedLayout = [] // gets rid of views going under navigation controller
        
        catagories = BudgetAPI.getCatagories()
        
        
        
        
        
        
        CatagoryCollectionView = UICollectionView(frame: .zero, collectionViewLayout: CatagoryCollectionViewFlowLayout())
        CatagoryCollectionView.translatesAutoresizingMaskIntoConstraints = false
        CatagoryCollectionView.dataSource = self
        CatagoryCollectionView.delegate = self
        CatagoryCollectionView.register(CatagoryCollectionViewCell.self, forCellWithReuseIdentifier: CatagoryReuseIdentifier)
        CatagoryCollectionView.showsHorizontalScrollIndicator = false
        CatagoryCollectionView.backgroundColor = .clear
        view.addSubview(CatagoryCollectionView)
        
        
        
        
        setupConstraints()
    }
    
    func setupConstraints() {
        
        
        //        heading.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        //        heading.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        //        heading.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        //        heading.bottomAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        //        heading.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        //
        CatagoryCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        CatagoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        CatagoryCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        CatagoryCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        CatagoryCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        
        
    }
    
    //MARK:
    //MARK: CollectionView Delegates / Datasources
    //MARK:
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return catagories.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //        UserDefaults.standard.set("mycoolusername", forKey: "username")
        //
        //        UserDefaults.standard.string(forKey: "username")
        
        let navViewController = catagorydetail()
        navViewController.hidesBottomBarWhenPushed = true
        navigationController?.pushViewController(navViewController, animated: true)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CatagoryReuseIdentifier, for: indexPath) as? CatagoryCollectionViewCell else { return UICollectionViewCell() }
        let catagory = catagories[indexPath.item]
        cell.contentView.layer.cornerRadius = 10
        cell.contentView.layer.borderWidth = 10
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        // cell.contentView.layer.masksToBounds = true
        cell.setup(withCatagories: catagory)
        
        return cell
        
    }
    
    
}


