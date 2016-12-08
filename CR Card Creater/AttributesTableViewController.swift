//
//  AttributesTableViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/5/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class AttributesTableViewController: UITableViewController {
    
    
   
    var attributes : Attributes!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    
    
    // MARK: - Table view data source
    
    /*override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
     // #warning Incomplete implementation, return the number of sections
     return 0
     }*/
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return attributes.nameAll.count
    }
    /*override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
     return 80.0
     }*/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        
        
        
        /*if indexPath.row != 0
        {*/
            let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! CustomTableViewCell
            cell.imgView.image = UIImage(named: attributes.imageAll[indexPath.row])
            
            cell.name.text = attributes.nameAll[indexPath.row]
            
            if attributes.names.contains(attributes.nameAll[indexPath.row])
            {
                cell.addAttribute.image = UIImage(named: "attribute_selection_add_button_inactive")
            }
            else{
                cell.addAttribute.image = UIImage(named: "attribute_selection_add_button")
            }
            
            cell.addBtn.addTarget(self, action: #selector(AttributesTableViewController.buttonHandler(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            cell.addBtn.tag = indexPath.row
             return cell
        /*}
        else{
            
            let cell = tableView.dequeueReusableCellWithIdentifier("customCell", forIndexPath: indexPath) as! CustomTableViewCell
            cell.addBtn.addTarget(self, action: #selector(AttributesTableViewController.buttonHandler(_:)), forControlEvents: UIControlEvents.TouchUpInside)
             return cell
        }*/
        
        
        
        //cell.addAttribute.image = UIImage(named: "attribute_selection_add_button")
        
        
        
       
    }
    
    
    func buttonHandler(sender : UIButton)
    {
        if attributes.names.contains( attributes.nameAll[sender.tag])
        {
           print(sender.tag) 
        }
        else //if sender.tag != 0
        {
            attributes.getValueType(attributes.nameAll[ sender.tag], controller : self)
        }
        
    }
    
    
    
        /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    /*
     // Override to support editing the table view.
     override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
     if editingStyle == .Delete {
     // Delete the row from the data source
     tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
     } else if editingStyle == .Insert {
     // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
     }
     }
     */
    
    /*
     // Override to support rearranging the table view.
     override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
