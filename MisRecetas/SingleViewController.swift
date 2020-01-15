//
//  SingleViewController.swift
//  MisRecetas
//
//  Created by Cristian Rojas on 21/11/2019.
//  Copyright © 2019 Cristian Rojas. All rights reserved.
//

import UIKit

class SingleViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var recipes : [Recipe] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var recipe = Recipe(name: "Tortilla de patatas",
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
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

// MARK: - UITableViewDataSource

extension SingleViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.recipes.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipe = recipes[indexPath.row]
        let cellID = "RecipeCell"
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! RecipeCell
        
        cell.thumbnailImage.image = recipe.image
        cell.nameLabel.text = recipe.name
        cell.timeLabel.text = "\(recipe.time!) min"
        cell.ingredientsLabel.text = "Ingredientes: \(recipe.ingredients.count)"
        
        cell.thumbnailImage.layer.cornerRadius = 42.0
        //cell.thumbnailImage.layer.masksToBounds = true
        
        if recipe.isFavourite {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        return cell
    }
    
   
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        //Compartir
        let shareAction = UITableViewRowAction(style: .default, title: "Compartir") { (action, indexPath) in
            let shareDefaultText = "Estoy mirando la receta de \(self.recipes[indexPath.row].name!) en la App del curso de iOS10 con juan gabriel"
            let shareImage = self.recipes[indexPath.row].image!
            let activityController = UIActivityViewController(activityItems: [shareDefaultText,shareImage], applicationActivities: nil)
            
            self.present(activityController, animated: true, completion: nil)
        }
        
        shareAction.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        //Borrar
        
        let deleteAction = UITableViewRowAction(style: .destructive, title: "Eliminar") { (action, indexPath) in
            self.recipes.remove(at: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .fade)
        }
        deleteAction.backgroundColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
        return [shareAction,deleteAction]
    }
}

// MARK: - UITableViewDelegate

extension SingleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      /* Permite crear un alert controler para añadir la receta a favoritos
         let recipe = self.recipes[indexPath.row]
        let alertController = UIAlertController(title: recipe.name, message: "Valora este plato", preferredStyle: .actionSheet)
        
        let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        var favouriteActionTitle = "Favorita"
        var favouriteActionStyle = UIAlertAction.Style.default
        
        if recipe.isFavourite {
            favouriteActionTitle = "Eliminar de favoritos"
            favouriteActionStyle = UIAlertAction.Style.destructive
        }
        let favouriteAction = UIAlertAction(title: favouriteActionTitle, style: favouriteActionStyle) { (action) in
            let recipe = self.recipes[indexPath.row]
            recipe.isFavourite = !recipe.isFavourite
            
            self.tableView.reloadData()
        }
        alertController.addAction(favouriteAction)
        
        self.present(alertController, animated: true, completion: nil)*/
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRecipeDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedRecipe = self.recipes[indexPath.row]
                let destinationViewController = segue.destination as! DetailViewController
                destinationViewController.recipe = selectedRecipe
            }
        }
    }
}
