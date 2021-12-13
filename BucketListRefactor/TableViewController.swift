//
//  ViewController.swift
//  BucketListRefactor
//
//  Created by admin on 13/12/2021.
//

import UIKit

class TableViewController: UITableViewController, TableViewDelegate {
    
    var items = ["Got to School", "Doing Homework", "Play Games" , "Doing laundry"]
    
    @IBOutlet weak var addBarButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BucketCell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
   
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        performSegue(withIdentifier: "EditSegue" , sender: indexPath)
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if sender is UIBarButtonItem {
            
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemViewController
            addItemTableViewController.delegate = self
            
        }
        
        else if  sender is IndexPath   {
            
            let navigationController = segue.destination as! UINavigationController
            let addItemTableViewController = navigationController.topViewController as! AddItemViewController
            addItemTableViewController.delegate = self
    
            let indexPath = sender as! NSIndexPath
            let item = items[indexPath.row]
            
            addItemTableViewController.item = item
            addItemTableViewController.indexPath = indexPath
        }
    }
    
    func cancelButtonPressed(by controller: AddItemViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func itemSaved(by controller: AddItemViewController, with text: String, at indexPath: NSIndexPath?) {
        
        if let ip = indexPath {
            
            items[ip.row] = text
        }
        else{
            
        items.append(text)
       
        }
        tableView.reloadData()
        dismiss(animated: true, completion: nil)
        
    }
    
}
