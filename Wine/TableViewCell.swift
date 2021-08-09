//
//  TableViewCell.swift
//  Wine
//
//  Created by Галина Збитнева on 07.08.2021.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var starsRatingImage: UIImageView!
    @IBOutlet weak var wineImageSmall: UIImageView!
    
    @IBOutlet weak var wineNameLabel: UILabel!
    
    @IBOutlet weak var wineRatingLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
