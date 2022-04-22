import UIKit

class PromoViewController: UIViewController, PayButtonDelegate {
    
    func onTapPayButton() {
    }
    
    @IBOutlet weak var paymethodTableView: UITableView!
    @IBOutlet weak var enterPromoTableView: UITableView!
    @IBOutlet weak var firstTableView: UITableView!
    @IBOutlet weak var backiv: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tapGestureRecognizer()
        
        firstTableView.dataSource = self
        firstTableView.delegate = self
        firstTableView.registerCell(identifier: firstTableViewCell.idenfifier)
        
        enterPromoTableView.dataSource = self
        enterPromoTableView.delegate = self
        enterPromoTableView.registerCell(identifier: enterPromoTableViewCell.idenfifier)
        
        paymethodTableView.dataSource = self
        paymethodTableView.delegate = self
        paymethodTableView.registerCell(identifier: secondTableViewCell.idenfifier)
    }
    
    @IBAction func payButton(_ sender: UIButton) {
        guard let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: ChooseCardViewController.self)) as? ChooseCardViewController else {return}
        vc.modalTransitionStyle = .coverVertical
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    func tapGestureRecognizer(){
        
        let tapGestforback = UITapGestureRecognizer(target: self, action: #selector(onTapBackiv))
        backiv.isUserInteractionEnabled = true
        backiv.addGestureRecognizer(tapGestforback)
        
    }
    @objc func onTapBackiv(){
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: String(describing: SeatViewController.self)) as! SeatViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true, completion: nil)
    }
}

extension PromoViewController: UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == firstTableView {
            return 1
        } else if tableView == enterPromoTableView {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if tableView == firstTableView {
            return tableView.dequeueCell(identifier: firstTableViewCell.idenfifier, indexPath: indexPath)
        } else if tableView == enterPromoTableView {
            return tableView.dequeueCell(identifier: enterPromoTableViewCell.idenfifier, indexPath: indexPath)
        } else if tableView == paymethodTableView {
            return tableView.dequeueCell(identifier: secondTableViewCell.idenfifier, indexPath: indexPath)
        } else {
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if tableView == firstTableView {
            return CGFloat(300)
        } else if tableView == enterPromoTableView {
            return CGFloat(180)
        } else {
            return CGFloat(300)
        }
    }
}
