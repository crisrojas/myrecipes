//
//  ViewController.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 15/11/2019.
//  Copyright © 2019 Cristian Rojas. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var recipes : [Recipe] = []
    var name = "Tortilla de papas"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        
        var recipe = Recipe(name: name,
                            image: #imageLiteral(resourceName: "tortilla-española"),
                            time: 20,
                            ingredients: ["Patatas", "Huevos", "Cebollas"],
                            steps: ["Pelar las patatas y la cebolla"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Pizza margarita",
                        image: #imageLiteral(resourceName: "no-image"),
                        time: 60,
                        ingredients: ["Tomate", "Chamiñones", "Cebolla", "Harina"],
                        steps: ["Cortar los tomates", "Hacer la masa con harina, levadura, aceite y sal"])
        recipes.append(recipe)
        
        recipe = Recipe(name: "Hamburguesa con queso",
                        image: #imageLiteral(resourceName: "no-image"),
                        time: 10,
                        ingredients: ["Carne", "Pan de hamburgesa", "Lechuga", "Bacon"],
                        steps: ["Hacer la carne al gusto", "Montar la hamburguesa "])
        recipes.append(recipe)

    
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.textLabel?.text = recipe.name
        cell.imageView?.image = recipe.image
        
        
        return cell
    }

}

