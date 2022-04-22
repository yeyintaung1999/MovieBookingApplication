import UIKit
import UPCarouselFlowLayout
import DGCarouselFlowLayout

class ChooseCardViewController: UIViewController {
    
    @IBOutlet weak var addnewcardview: UIStackView!
    @IBOutlet weak var cardCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardCollectionView.dataSource=self
        cardCollectionView.delegate=self
        cardCollectionView.registerCell(identifier: CardCollectionViewCell.idenfifier)
        
        let layout = UPCarouselFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sideItemScale = 0.8
        layout.sideItemShift = 1
        layout.spacingMode = UPCarouselFlowLayoutSpacingMode.fixed(spacing: 10)
        layout.itemSize = CGSize(width: 200,height: 200)
        cardCollectionView.collectionViewLayout = layout
        
        
        tapGestureRecognizer()
    }
    
    func tapGestureRecognizer(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onTap))
        
        addnewcardview.isUserInteractionEnabled = true
        addnewcardview.addGestureRecognizer(tapGesture)
    }
    
    @objc func onTap(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: AddCardViewController.self)) as! AddCardViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: TicketViewController.self)) as! TicketViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PromoViewController.self)) as! PromoViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
}

extension ChooseCardViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeCell(identifier: CardCollectionViewCell.idenfifier, indexPath: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/1.2, height: 180)
    }
}

