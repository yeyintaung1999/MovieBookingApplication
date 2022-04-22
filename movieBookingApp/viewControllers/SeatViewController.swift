import UIKit

class SeatViewController: UIViewController {
    
    @IBOutlet weak var ivBack: UIImageView!
    @IBOutlet weak var seatCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGesture()
        
        seatCollectionView.dataSource=self
        seatCollectionView.delegate=self
        seatCollectionView.registerCell(identifier: SeatCollectionViewCell.idenfifier)
    }
    
    @IBAction func buyTicketButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: PromoViewController.self)) as! PromoViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    func tapGesture(){
        let tapgestforivback = UITapGestureRecognizer(target: self, action: #selector(onTapBack))
        ivBack.isUserInteractionEnabled = true
        ivBack.addGestureRecognizer(tapgestforivback)
    }
    
    @objc func onTapBack(){
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ChooseDateTimeViewController.self)) as! ChooseDateTimeViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

extension SeatViewController : UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 70
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(identifier: SeatCollectionViewCell.idenfifier, indexPath: indexPath) as! SeatCollectionViewCell
        cell.bindData(seatVo: seatData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/10, height: 40)
    }
}
