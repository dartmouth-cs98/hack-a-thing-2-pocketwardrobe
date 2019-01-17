//
//  ClothesTableViewCell.swift
//  PocketWardrobe
//
//  Created by Daniel H Kim on 1/16/19.
//  Copyright © 2019 Jane Lee. All rights reserved.
//

import UIKit

class ClothesTableViewCell: UITableViewCell {

    //MARK: Actions
    @IBAction func unwindToMealList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ClothesViewController, let cloth = sourceViewController.cloth {
            
            // Add a new meal.
            let newIndexPath = IndexPath(row: clothes.count, section: 0)
            
            clothes.append(cloth)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }


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
