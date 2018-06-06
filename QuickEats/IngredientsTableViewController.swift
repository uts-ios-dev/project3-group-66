//
//  IngredientsTableViewController.swift
//  QuickEats
//
//  Created by Aakash Mehta on 14/5/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import UIKit

class IngredientsTableViewController: UITableViewController {

    @IBOutlet weak var ingredientCell: UITableViewCell!
    
    var ingredients : [Ingredients] = [
        Ingredients(ingredient: "Milk", selected: true),
        Ingredients(ingredient: "Bread", selected: true),
        Ingredients(ingredient: "Eggs", selected: true),
        Ingredients(ingredient: "Bacon", selected: true),
        Ingredients(ingredient: "Butter", selected: true),
        Ingredients(ingredient: "Jam", selected: true),
        Ingredients(ingredient: "Avocado", selected: true)]
    
    var selectedIngredients = [Ingredients] ()
    var selectedIngredient: Ingredients?
    
    var recipes = [Recipe]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        self.navigationItem.title = "Please select ingredients"
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ingredients.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ingredientsCell", for: indexPath)

         //Configure the cell...
        let ing = ingredients[indexPath.row]
        cell.textLabel?.text = ing.ingredient
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark){
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
           //TODO remove ingredients from the list
        }
        else{
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
            selectedIngredient = Ingredients.init(ingredient: tableView.cellForRow(at: indexPath)?.textLabel?.text as! String, selected: true)
            selectedIngredients.append(selectedIngredient!)
            print(selectedIngredients.count)
        }
    }
    
    func getRecipe(){

        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients=apples%2Cflour%2Csugar")!)
        request.httpMethod = "GET"
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        request.addValue("d1PeohR5M7mshSqfEcvIX43EgrQRp1UTfbwjsnJz7Ea73Ns3aM", forHTTPHeaderField: "X-Mashape-Key")
        let session = URLSession.shared
        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
            //print(response!)
            do {
                guard let data = data else {
                    print("Error: No data to decode")
                    return
                }

                guard let recipesReceived = try? JSONDecoder().decode([Recipe].self, from: data) else {
                    print("Error: Couldn't decode data into Blog")
                    return
                }
                for recipe in recipesReceived{
                    self.recipes.append(recipe)
                }
                
               // UserDefaults.standard.set(recipes, forKey: "recipes")

            } catch let dataError{
                print("error",dataError)
            }
        })
        task.resume()
    }
    
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
        UserDefaults.standard.set(selectedIngredients, forKey: "selectedIngredients")
        getRecipe()
        UserDefaults.standard.set(recipes, forKey: "recipes")
        
        //getAllTodos()
    }
}
