//
//  firstTableViewCell.swift
//  movieBookingApp
//
//  Created by Ye Yint Aung on 28/02/2022.
//

import UIKit

class firstTableViewCell: UITableViewCell {

    @IBOutlet weak var firstComboTableView: UITableView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        firstComboTableView.dataSource=self
        firstComboTableView.delegate=self
        firstComboTableView.registerCell(identifier: ComboTableViewCell.idenfifier)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension firstTableViewCell: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(identifier: ComboTableViewCell.idenfifier, indexPath: indexPath)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(100)
    }
}
