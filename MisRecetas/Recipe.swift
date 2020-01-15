//
//  Recipe.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 16/11/2019.
//  Copyright © 2019 Cristian Rojas. All rights reserved.
//

import Foundation
import UIKit

class Recipe: NSObject {
    var name: String!
    var image: UIImage!
    var time: Int!
    var ingredients: [String]!
    var steps: [String]!
    var isFavourite: Bool = false
    
    init(name: String, image: UIImage, time: Int, ingredients: [String], steps: [String]) {
        self.name = name
        self.image = image
        self.time = time
        self.ingredients = ingredients
        self.steps = steps
    }
}
