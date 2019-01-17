//
//  Clothes.swift
//  PocketWardrobe
//
//  Created by Daniel H Kim on 1/16/19.
//  Copyright © 2019 Jane Lee. All rights reserved.
//

import UIKit

class Clothes {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    
    //MARK: Initialization
    
    init?(name: String, photo: UIImage?) {
        
        if name.isEmpty {
            return nil
        }
        
        self.name = name
        self.photo = photo
    }
    
    
}

