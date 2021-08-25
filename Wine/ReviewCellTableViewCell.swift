//
//  ReviewCellTableViewCell.swift
//  Wine
//
//  Created by Галина Збитнева on 18.08.2021.
//

import UIKit

class ReviewCellTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewerNameLabel: UILabel!
    
    
    @IBOutlet weak var reviewLabel: UILabel!
    
    
    @IBOutlet weak var reviewRatingLabel: UILabel!
    
    @IBOutlet weak var likeImage: UIImageView!
    
    @IBOutlet weak var dislikeImage: UIImageView!
    
    @IBOutlet weak var numberOfLikeLabel: UILabel!
    
    
    @IBOutlet weak var starImage: UIImageView!
    @IBOutlet weak var numberOfDislikeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
