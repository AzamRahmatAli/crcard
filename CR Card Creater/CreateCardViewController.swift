//
//  CreateCardViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 11/30/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class CreateCardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet weak var tableHeight: NSLayoutConstraint!

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var discription: UITextField!
    @IBOutlet weak var addAttribute: UIButton!
    @IBOutlet weak var createUpdate: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var rarity: UIImageView!
    @IBOutlet weak var type: UIImageView!
    @IBOutlet weak var elixirCost: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
       reloadTable() 
        // Do any additional setup after loading the view.
    }

    @IBAction func editRarity(sender: UIButton) {
    }
    @IBAction func editType(sender: UIButton) {
    }

    @IBAction func costEdit(sender: UIButton) {
    }
    @IBAction func addImage(sender: UIButton) {
    }
    
    @IBAction func addAttribute(sender: UIButton) {
    }
    
    @IBAction func CreateUpdate(sender: UIButton) {
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 5
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)
     
     // Configure the cell...
     
     return cell
     }
    
    
    func reloadTable() {
        
        tableHeight.constant = 2.5 * tableHeight.constant
        tableView.reloadData()
        //plus anything else you want to accomplish
    }
}
