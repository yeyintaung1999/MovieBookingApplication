import UIKit
import SDWebImage

class MainScreenViewController: UIViewController {
    
    let networkAgent : NetworkAgent = NetworkAgent.shared
    
    var profiledata : LoginDataClass?
    var currentShowingMovie : [MovieStruct]?

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var showingCollectionView: UICollectionView!
    @IBOutlet weak var comingCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        username.text = "Hi \(profiledata?.name ?? "")!"
        let imageurl = "\(profiledata?.profileImage ?? "")"
        
        profileImage.sd_setImage(with: URL(string: imageurl))
        
        showingCollectionView.dataSource = self
        showingCollectionView.delegate = self
        showingCollectionView.registerCell(identifier: movieSliderCollectionViewCell.idenfifier)
        
        comingCollectionView.dataSource = self
        comingCollectionView.delegate = self
        comingCollectionView.registerCell(identifier: movieSliderCollectionViewCell.idenfifier)
        
        getNetworkData()
    }
    
    func getNetworkData(){
        getCurrentShowingMovie()
    }
    
    func getCurrentShowingMovie(){
        networkAgent.currentShowing { [weak self] result in
            guard let self = self else {return}
            switch result {
            case .success(let data):
                self.currentShowingMovie = data.data
                self.showingCollectionView.reloadData()
            case .failure(let message): print(message)
            }
        }
    }

}

extension MainScreenViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return currentShowingMovie?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(identifier: movieSliderCollectionViewCell.idenfifier, indexPath: indexPath) as! movieSliderCollectionViewCell
        cell.data = currentShowingMovie![indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2.7, height: 250)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MovieViewController.self)) as! MovieViewController
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
        
    }
}
