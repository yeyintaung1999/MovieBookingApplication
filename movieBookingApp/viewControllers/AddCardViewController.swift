import UIKit
import SideMenu

class AddCardViewController: UIViewController {
    
    @IBOutlet weak var cardNumberTF: UITextField!
    @IBOutlet weak var cvcTF: UITextField!
    @IBOutlet weak var expDateTF: UITextField!
    @IBOutlet weak var cardHolderTF: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        underlinedTF(textFieldName: cardNumberTF)
        underlinedTF(textFieldName: cvcTF)
        underlinedTF(textFieldName: expDateTF)
        underlinedTF(textFieldName: cardHolderTF)
        
    }
    
    @IBAction func confirmButton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ChooseCardViewController.self)) as! ChooseCardViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func backbutton(_ sender: UIButton) {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ChooseCardViewController.self)) as! ChooseCardViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
}
