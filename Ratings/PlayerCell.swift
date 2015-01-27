//
//  PlayerCell.swift
//  Ratings
//
//  Created by KEEVIN MITCHELL on 1/27/15.
//  Copyright (c) 2015 Beyond 2021. All rights reserved.
//

import UIKit

class PlayerCell: UITableViewCell {
    
     
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var gameLabel1: UILabel!

    @IBOutlet weak var ratingImageView1: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
