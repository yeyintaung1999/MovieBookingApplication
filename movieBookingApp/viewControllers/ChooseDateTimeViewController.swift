import UIKit

class ChooseDateTimeViewController: UIViewController {
    @IBOutlet weak var collectionViewA: UICollectionView!
    @IBOutlet weak var collectionViewB: UICollectionView!
    @IBOutlet weak var collectionViewC: UICollectionView!
    @IBOutlet weak var collectionViewD: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewA.dataSource = self
        collectionViewA.delegate = self
        collectionViewA.registerCell(identifier: cvACollectionViewCell.idenfifier)
        
        collectionViewB.dataSource = self
        collectionViewB.delegate = self
        collectionViewB.registerCell(identifier: cvBCDCollectionViewCell.idenfifier)
        
        collectionViewC.dataSource = self
        collectionViewC.delegate = self
        collectionViewC.registerCell(identifier: cvBCDCollectionViewCell.idenfifier)
        
        collectionViewD.dataSource = self
        collectionViewD.delegate = self
        collectionViewD.registerCell(identifier: cvBCDCollectionViewCell.idenfifier)
        
    }
    
    @IBAction func backButton(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MovieViewController.self)) as! MovieViewController
        
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
        
    }
    
    @IBAction func nextButton(_ sender: Any) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SeatViewController.self)) as! SeatViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
    
}

extension ChooseDateTimeViewController:UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewA {
            return 7
        } else if collectionView == collectionViewB {return 3} else {return 6}
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == collectionViewA {
            let cellA = collectionView.dequeCell(identifier: cvACollectionViewCell.idenfifier, indexPath: indexPath) as cvACollectionViewCell
            
            return cellA
        } else {
            let cellBCD = collectionView.dequeCell(identifier: cvBCDCollectionViewCell.idenfifier, indexPath: indexPath)
            return cellBCD
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == collectionViewA {
            return CGSize(width: collectionView.frame.width/5, height: 70)
        } else {
            return CGSize(width: collectionView.frame.width/3.2, height: 50)
        }
    }
}
