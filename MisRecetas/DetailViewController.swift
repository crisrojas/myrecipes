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
    @IBOutlet var recipeImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var ratingButton: UIButton!
    
    var recipe : Recipe!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = recipe.name
        
        self.recipeImageView.image = self.recipe.image
        self.recipeTime.text = String(self.recipe.time)
        self.tableView.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        self.tableView.tableFooterView = UIView(frame: CGRect.zero)
        self.tableView.separatorColor = UIColor(red: 0.9, green: 0.9, blue: 0.9, alpha: 0.25)
        
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension
        
        
        ratingButton.setTitle(self.recipe.rating, for: .normal)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func close(segue: UIStoryboardSegue) {
        if let ratingViewController = segue.source as? RatingViewController {
            if let rating = ratingViewController.ratingSelected {
                self.recipe.rating = rating
                ratingButton.setTitle(self.recipe.rating, for: .normal)
            }
        }
    }
   
}

extension DetailViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 2
        case 1:
            return self.recipe.ingredients.count
        case 2:
            return self.recipe.steps.count
        default:
            return 0 // Si llega un caso que no es ni el 0,1,2 devuelve ninguna sección
        }

    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "DetailRecipeCell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for:indexPath) as! RecipeDetailCell
        cell.backgroundColor = UIColor.clear
        switch indexPath.section {
        case 0:
            switch indexPath.row {
                   case 0:
                       cell.keyLab.text = "Nombre:"
                       cell.valueLab.text = self.recipe.name
                   case 1:
                       cell.keyLab.text = "Tiempo:"
                       cell.valueLab.text = "\(String(describing: self.recipe.time!)) min"
                   /*case 2:
                       cell.keyLab.text = "Favorita:"
                       if self.recipe.isFavourite {
                           cell.valueLab.text = "Si"
                       } else {
                           cell.valueLab.text = "No"
                       }*/
                   default:break
                   }
        case 1:
            cell.keyLab.text = ""
            cell.valueLab.text = "\(self.recipe.ingredients[indexPath.row])"
        case 2:
            cell.keyLab.text = ""
            cell.valueLab.text = "\(self.recipe.steps[indexPath.row])"
        default: break
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var title = ""
        switch section {
        case 1:
            title = "🌶 Ingredientes"
        case 2:
            title = "⚙️ Pasos"
        default: break
        }
        return title
    }
}

extension DetailViewController: UITableViewDelegate {
    
}
