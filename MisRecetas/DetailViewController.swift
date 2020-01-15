//
//  DetailViewController.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 15/01/2020.
//  Copyright © 2020 Cristian Rojas. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    //
    
    @IBOutlet var recipeTime: UILabel!
    @IBOutlet var recipeName: UILabel!
    @IBOutlet var recipeImageView: UIImageView!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.recipeImageView.image = self.recipe.image
        self.recipeName.text = self.recipe.name
        self.recipeTime.text = String(self.recipe.time)

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

        
}
