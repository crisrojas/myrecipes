//
//  RecipeCell.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 21/11/2019.
//  Copyright © 2019 Cristian Rojas. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {
    @IBOutlet var thumbnailImage: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    @IBOutlet var ingredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
