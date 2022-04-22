//
//  SeatCollectionViewCell.swift
//  movieBookingApp
//
//  Created by Ye Yint Aung on 24/02/2022.
//

import UIKit

class SeatCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var seatView: UIView!
    
    @IBOutlet weak var seatLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func bindData(seatVo: SeatVO){
        
        if seatVo.isSeatEmpty() {
            seatView.backgroundColor = UIColor.white
            seatLabel.text = seatVo.title
            
            
        } else if seatVo.isSeatTitle() {
            seatLabel.text = seatVo.title
            seatView.backgroundColor = UIColor.white
            
        } else if seatVo.isSeatAvailable() {
            seatLabel.text = seatVo.title
            seatView.backgroundColor = UIColor(named: "availableColor") ?? UIColor.lightGray
            seatView.clipsToBounds=true
            seatView.layer.cornerRadius=8
            seatView.layer.maskedCorners=[ .layerMinXMinYCorner, .layerMaxXMinYCorner]
            
        } else if seatVo.isSeatSelected() {
            seatLabel.text = seatVo.title
            seatView.backgroundColor = UIColor(named: "primaryColor") 
            seatView.clipsToBounds=true
            seatView.layer.cornerRadius=8
            seatView.layer.maskedCorners=[ .layerMinXMinYCorner, .layerMaxXMinYCorner]
        } else {
            seatLabel.text = seatVo.title
            seatView.backgroundColor = UIColor(named: "takenColor") ?? UIColor.darkGray
            seatView.clipsToBounds=true
            seatView.layer.cornerRadius=8
            seatView.layer.maskedCorners=[ .layerMinXMinYCorner, .layerMaxXMinYCorner]
            
        }
        
    }

}
