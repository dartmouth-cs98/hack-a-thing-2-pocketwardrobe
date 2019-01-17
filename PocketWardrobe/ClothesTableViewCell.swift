//
//  ClothesTableViewCell.swift
//  PocketWardrobe
//
//  Created by Daniel H Kim on 1/16/19.
//  Copyright © 2019 Jane Lee. All rights reserved.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {

    //MARK: Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
