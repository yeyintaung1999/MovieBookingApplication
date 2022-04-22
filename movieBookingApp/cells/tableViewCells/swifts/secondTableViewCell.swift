import UIKit

class secondTableViewCell: UITableViewCell {
    
    @IBOutlet weak var paymentTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        paymentTableView.dataSource=self
        paymentTableView.delegate=self
        paymentTableView.registerCell(identifier: paymethodTableViewCell.idenfifier)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }
}

extension secondTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(identifier: paymethodTableViewCell.idenfifier, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(70)
    }
}
