//
//  AttributesTableViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/5/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class AttributesTableViewController: UITableViewController {
    
    
    let name : [String] = ["Hitpoints","Shield Hitpoints", "Damage Per Second", "Damage", "Area Damage", "Death Damage", "Crown Tower Damage", "Hit Speed", "Targets", "Deploy Time", "Speed", "Range", "Duration", "Radius", "Lifetime" , "Stun Duration", "Spawn Speed", "Count", "Boost", "Rage Effect", "Freeze Duration"]
    let image : [String] = ["icons_stats_hitpoints","icons_stats_shield_hitpoints", "icons_stats_damage_per_second", "icons_stats_damage", "icons_stats_area_damage", "icons_stats_death_damage", "icons_stats_crown_tower_damage", "icons_stats_hit_speed", "icons_stats_targets", "icons_stats_deploy_time", "icons_stats_speed", "icons_stats_range", "icons_stats_spawn_speed", "icons_stats_radius", "icons_stats_spawn_speed" , "icons_stats_freeze_duration", "icons_stats_spawn_speed", "icons_stats_count", "icons_stats_boost", "icons_stats_rage_effect", "icons_stats_freeze_duration"]
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
        return name.count
    }
    /*override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80.0
    }*/
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! CustomTableViewCell
            cell.addBtn.tag = indexPath.row
        
        cell.imgView.image = UIImage(named: image[indexPath.row])
        cell.name.text = name[indexPath.row]
        if attributes.name.contains(name[indexPath.row])
        {
        cell.addAttribute.image = UIImage(named: "attribute_selection_add_button_inactive")
        }
        else
        {
            cell.addBtn.addTarget(self, action: #selector(AttributesTableViewController.buttonHandler(_:)), forControlEvents: UIControlEvents.TouchUpInside)
           cell.addAttribute.image = UIImage(named: "attribute_selection_add_button")
        }
        // Configure the cell...

        return cell
    }
    
    
    func buttonHandler(sender : UIButton)
    {
        print(sender.tag)
        let alert = UIAlertController(title: name[sender.tag],  message: "", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
            textField.placeholder = "Value"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default) { (action: UIAlertAction!) -> Void in
                                        
                                        print("do your stuff here")
                                        let textField = alert.textFields![0] as UITextField
                                        print("Text field: \(textField.text)")
                                        if textField.text != ""
                                        {
                                            self.attributes.name.append(self.name[sender.tag])
                                            self.attributes.image.append(self.image[sender.tag])
                                            self.attributes.value.append(textField.text!)
                                            self.navigationController?.popViewControllerAnimated(true)
                                        }
                                        else
                                        {
                                            
                                        }
        }
        
        saveAction.enabled = false
        NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object:alert.textFields?[0],
                                                                queue: NSOperationQueue.mainQueue()) { (notification) -> Void in
                                                                    
                                                                    let textFieldValue = alert.textFields?[0]
                                                                    
                                                                    saveAction.enabled = !textFieldValue!.text!.isEmpty
        }

        //3. Grab the value from the text field, and print it when the user clicks OK.
       
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(saveAction)
        // 4. Present the alert.
        self.presentViewController(alert, animated: true, completion: nil)
            
        
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