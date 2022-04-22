//
//  movieSliderCollectionViewCell.swift
//  movieBookingApp
//
//  Created by Ye Yint Aung on 23/02/2022.
//

import UIKit
import SDWebImage

class movieSliderCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backdropImage: UIImageView!
    
    @IBOutlet weak var genreTime: UILabel!
    @IBOutlet weak var movieName: UILabel!
    var data : MovieStruct? {
        didSet{
            if let data = data {
                let imagepath = data.images?.originalImage
                
                movieName.text = data.originalTitle
                genreTime.text = data.duration
                backdropImage.sd_setImage(with: URL(string: data.images?.originalImage ?? ""))
            }
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

}
