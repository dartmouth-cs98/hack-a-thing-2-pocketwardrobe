//
//  ClothesTableViewController.swift
//  PocketWardrobe
//
//  Created by Daniel H Kim on 1/16/19.
//  Copyright © 2019 Jane Lee. All rights reserved.
//

import UIKit
import os.log

class ClothesTableViewController: UITableViewController {

    //MARK: Properties
    var clothes = [Clothes]()
    
    //MARK: Actions
    @IBAction func unwindToClothesList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? ClothesViewController, let cloth = sourceViewController.clothes {
            if let selectedIndexPath = tableView.indexPathForSelectedRow {
                // Update an existing item.
                clothes[selectedIndexPath.row] = cloth
                tableView.reloadRows(at: [selectedIndexPath], with: .none)
            }
            else {
                // Add a new meal.
                let newIndexPath = IndexPath(row: clothes.count, section: 0)
                
                clothes.append(cloth)
                tableView.insertRows(at: [newIndexPath], with: .automatic)
            }
            
            // Add a new piece of clothes.
            let newIndexPath = IndexPath(row: clothes.count, section: 0)
            
            clothes.append(cloth)
            tableView.insertRows(at: [newIndexPath], with: .automatic)
        }
    }

    //MARK: Private Methods
    private func loadSampleClothes() {
        let photo1 = UIImage(named: "cloth1")
        let photo2 = UIImage(named: "cloth2")
        let photo3 = UIImage(named: "cloth3")
    
        guard let cloth1 = Clothes(name: "Shoes", photo: photo1) else {
            fatalError("Unable to instantiate cloth1")
        }
        
        guard let cloth2 = Clothes(name: "Sweater", photo: photo2) else {
            fatalError("Unable to instantiate cloth2")
        }
        
        guard let cloth3 = Clothes(name: "Jacket", photo: photo3) else {
            fatalError("Unable to instantiate cloth3")
        }
        
        clothes += [cloth1, cloth2, cloth3]
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Load the sample data.
        loadSampleClothes()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return clothes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Table view cells are reused and should be dequeued using a cell identifier.
        let cellIdentifier = "ClothesTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ClothesTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ClothesTableViewCell.")
        }
        
        // Fetches the appropriate cloth for the data source layout.
        let cloth = clothes[indexPath.row]
        
        cell.nameLabel.text = cloth.name
        cell.photoImageView.image = cloth.photo
        
        return cell
    }
 

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: segue, sender: sender)
        
        switch(segue.identifier ?? "") {
            
        case "AddItem":
            os_log("Adding a new piece of clothes.", log: OSLog.default, type: .debug)
            
        case "ShowDetail":
            guard let clothesDetailViewController = segue.destination as? ClothesViewController else {
                fatalError("Unexpected destination: \(segue.destination)")
            }
            
            guard let selectedClothesCell = sender as? ClothesTableViewCell else {
                fatalError("Unexpected sender: \(sender)")
            }
            
            guard let indexPath = tableView.indexPath(for: selectedClothesCell) else {
                fatalError("The selected cell is not being displayed by the table")
            }
            
            let selectedClothes = clothes[indexPath.row]
            clothesDetailViewController.clothes = selectedClothes
            
        default:
            fatalError("Unexpected Segue Identifier; \(segue.identifier)")
        }
    }
    

}
