//
//  RecipeDetailCell.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 20/02/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import UIKit

class RecipeDetailCell: UITableViewCell {

    @IBOutlet weak var keyLab: UILabel!
    @IBOutlet weak var valueLab: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
