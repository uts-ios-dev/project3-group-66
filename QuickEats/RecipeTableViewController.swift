//
//  RecipeTableViewController.swift
//  QuickEats
//
//  Created by Aakash Mehta on 31/5/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import UIKit

class RecipeTableViewController: UITableViewController{
    
    @IBOutlet weak var recipeCell: UITableViewCell!
    
   var recipes = [Recipe]()
    
    override func viewWillAppear(_ animated: Bool) {
        //getRecipe()
    }
   
   // var recipes = Recipe?.self
    override func viewDidLoad() {
       
        super.viewDidLoad()
        //recipes = (UserDefaults.standard.object(forKey: "recipes")) as! [Recipe]
         //getRecipe()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
//    func getRecipe(){
//
//        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients=apples%2Cflour%2Csugar")!)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("d1PeohR5M7mshSqfEcvIX43EgrQRp1UTfbwjsnJz7Ea73Ns3aM", forHTTPHeaderField: "X-Mashape-Key")
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            //print(response!)
//            do {
//                guard let data = data else {
//                    print("Error: No data to decode")
//                    return
//                }
//
//                guard let recipesReceived = try? JSONDecoder().decode([Recipe].self, from: data) else {
//                    print("Error: Couldn't decode data into Blog")
//                    return
//                }
//                //self.recipes = recipesReceived
//                //return recipes
//                //print(recipesReceived)
//                print(recipesReceived[1].title)
//                //print(recipesReceived[1].id)
//                for receivedRecipe in recipesReceived{
//                    self.recipes.append(receivedRecipe)
//                }
//
//                //return recipes
//            } catch let dataError{
//                print("error",dataError)
//            }
//        })
//        task.resume()
//    }

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
         //getRecipe()
        return recipes.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! CustomRecipeTableViewCell
        
        let ing = recipes[indexPath.row]
        cell.recipeTitle.text = ing.title
        return cell
//        //Test
//        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients=apples%2Cflour%2Csugar")!)
//        request.httpMethod = "GET"
//        request.addValue("application/json", forHTTPHeaderField: "Accept")
//        request.addValue("d1PeohR5M7mshSqfEcvIX43EgrQRp1UTfbwjsnJz7Ea73Ns3aM", forHTTPHeaderField: "X-Mashape-Key")
//        let session = URLSession.shared
//        let task = session.dataTask(with: request, completionHandler: { data, response, error -> Void in
//            //print(response!)
//            do {
//                guard let data = data else {
//                    print("Error: No data to decode")
//                    return
//                }
//
//                guard let recipes = try? JSONDecoder().decode([Recipe].self, from: data) else {
//                    print("Error: Couldn't decode data into Blog")
//                    return
//                }
//                // return recipes
//                print(recipes)
//                //                print(recipes[1].title)
//                //                print(recipes[1].id)
//                for recipe in recipes{
//                    self.recipeCell.textLabel?.text = ing.title
//                   // self.recipeCell.imageView?.image = UIImageView(recipe.image)
//                }
//
//
//            } catch let dataError{
//                print("error",dataError)
//            }
//
//
//        })
//
//        task.resume()
        
    }
    

}
