//
//  RecipeViewController.swift
//  QuickEats
//
//  Created by Aakash Mehta on 2/6/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var recipeCell: CustomRecipeTableViewCell!
    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.gray)
    
    
    var recipes = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myActivityIndicator.sizeToFit()
        myActivityIndicator.center = view.center
        myActivityIndicator.startAnimating()
        view.addSubview(myActivityIndicator)
        UIApplication.shared.beginIgnoringInteractionEvents()
        getRecipe{
            print("succesfull")
            self.tableView.reloadData()
        }
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //Rest API call to get recipes
    func getRecipe(completed: @escaping()->()){

        let defaults = UserDefaults.standard
        let ingredients = defaults.stringArray(forKey: "ingredients") ?? [String]()
        var updatedUrl = String()
        for ingredient in ingredients{
            updatedUrl = updatedUrl+"%2C"+ingredient
        }
        print(updatedUrl)
        var request = URLRequest(url: URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.mashape.com/recipes/findByIngredients?ingredients="+updatedUrl)!)
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

                self.recipes = try! JSONDecoder().decode([Recipe].self, from: data)
                
                DispatchQueue.main.async {
                    completed()
                    self.myActivityIndicator.stopAnimating()
                    UIApplication.shared.endIgnoringInteractionEvents()
                }
            } catch let dataError{
                print("error",dataError)
            }
        })
        task.resume()
    }

    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let recipeCell = tableView.dequeueReusableCell(withIdentifier: "recipeCell") as! CustomRecipeTableViewCell
        let imageUrl = recipes[indexPath.row].image
        let url = URL(string: imageUrl!)
        let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
        recipeCell.recipeTitle.text = recipes[indexPath.row].title
        recipeCell.recipeImage.image = UIImage(data: data!)
        recipeCell.recipeLikes.text = "Likes: \(recipes[indexPath.row].likes)"
        return recipeCell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
