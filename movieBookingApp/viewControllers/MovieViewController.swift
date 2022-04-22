import UIKit

class MovieViewController: UIViewController {
    @IBOutlet weak var castcollectionView: UICollectionView!
    
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var ivBack: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailView.layer.cornerRadius = 10
        detailView.layer.maskedCorners = [ .layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        castcollectionView.dataSource=self
        castcollectionView.delegate=self
        castcollectionView.registerCell(identifier: CastCollectionViewCell.idenfifier)
        
        tapGestureRecognizer()
    }
    
    @IBAction func getTicketButton(_ sender: UIButton) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ChooseDateTimeViewController.self)) as! ChooseDateTimeViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
        
    }
    
    func tapGestureRecognizer(){
        let tapGestRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTapIV))
        ivBack.isUserInteractionEnabled=true
        ivBack.addGestureRecognizer(tapGestRecognizer)
    }
    
    @objc func onTapIV(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MainScreenViewController.self)) as! MainScreenViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
}

extension MovieViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeCell(identifier: CastCollectionViewCell.idenfifier, indexPath: indexPath)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/3, height: collectionView.frame.width/3)
    }
}
