//
//  CustomRecipeTableViewCell.swift
//  QuickEats
//
//  Created by Aakash Mehta on 2/6/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import UIKit

class CustomRecipeTableViewCell: UITableViewCell {
    //@IBOutlet weak var recipeImage: UIImageView!
    //@IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeLikes: UILabel!
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
