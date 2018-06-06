//
//  IngredientsViewController.swift
//  QuickEats
//
//  Created by Aakash Mehta on 2/6/18.
//  Copyright © 2018 Aakash Mehta. All rights reserved.
//
//Reference:https://github.com/Stan-Ost/TableViewWithMultipleSelection

import UIKit

class IngredientsViewController: UIViewController {

    var viewModel = ViewModel()
    
    @IBOutlet weak var tableView: UITableView?
    @IBOutlet weak var nextButton: UIButton?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Please Select Ingredients"
        tableView?.register(CustomCell.nib, forCellReuseIdentifier: CustomCell.identifier)
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        tableView?.allowsMultipleSelection = true
        tableView?.dataSource = viewModel
        tableView?.delegate = viewModel
        tableView?.separatorStyle = .none
        
        viewModel.didToggleSelection = { [weak self] hasSelection in
            self?.nextButton?.isEnabled = hasSelection
        }
    }
    
    @IBAction func next(_ sender: Any) {
        
        let defaults = UserDefaults.standard
        defaults.set(viewModel.selectedItems.map{$0.title}, forKey: "ingredients")
        print(viewModel.selectedItems.map { $0.title })
        tableView?.reloadData()
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
