import UIKit

class TicketViewController: UIViewController {
    
    @IBOutlet weak var clearimageview: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureForClear()
    }
    
    func tapGestureForClear(){
        let tapgest = UITapGestureRecognizer(target: self, action: #selector(onTapClear))
        clearimageview.isUserInteractionEnabled = true
        clearimageview.addGestureRecognizer(tapgest)
    }
    
    @objc func onTapClear(){
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: MainScreenViewController.self)) as? MainScreenViewController else {return}
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
}
