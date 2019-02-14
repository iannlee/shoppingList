//
//  ViewController.swift
//  shoppingList
//
//  Created by Ian Lee on 2/8/19.
//  Copyright © 2019 John Hersey High School. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var newItemTextField: UITextField!
  
    @IBOutlet weak var tableView: UITableView!
    
    var foodNeeds:[Item] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        let itemOne = Item(name: "Cheese")
        let itemTwo = Item(name: "Carrots", quantity: 12)
        let itemThree = Item(name: "Apples", quantity: 4)
        
        
        foodNeeds = [itemOne, itemTwo, itemThree]

    }

    @IBAction func addItemButtonPressed(_ sender: Any) {
        if let newItemName = newItemTextField.text, newItemName != ""{
            let newItem = Item(name: newItemName)
            foodNeeds.append(newItem)
            tableView.reloadData()
            
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodNeeds.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // let cell = tableView.dequeueReusableCell(withIdentifier: "myCell")! but can crash
        if let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") {
            let itemName = foodNeeds[indexPath.row].name
            let itemNumber = foodNeeds[indexPath.row].quantity
            cell.textLabel?.text = itemName
            cell.detailTextLabel?.text = "Quantity: \(itemNumber)"
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
}

