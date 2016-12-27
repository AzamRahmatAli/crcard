//
//  MenuTableViewController.swift
//  H&H
//
//  Created by Azad on 19/03/2016.
//  Copyright © 2016 Azad. All rights reserved.
//

import UIKit
import CoreData



class MenuTableViewController: UITableViewController {
    
   // @IBOutlet weak var cellAsButton: UIButton!
    
    @IBOutlet weak var appName: UILabel!

  
    @IBOutlet weak var dashBoard: UIImageView!
    @IBOutlet weak var quickSummary: UIImageView!
    //@IBOutlet weak var currency: UILabel!
    
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        switchColor(1)
        appName.text = StringFor.appName.rawValue
        
       // cellAsButton.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    }
    
    func switchColor(index : Int)
    {
        dashBoard.tintColor = UIColor.lightGrayColor()
        quickSummary.tintColor = UIColor.lightGrayColor()
        //setting.tintColor = UIColor.lightGrayColor()
        //help.tintColor = UIColor.lightGrayColor()
        if index == 1
        {
            dashBoard.tintColor = Helper.colors[0]//UIColor(red: 0, green : 0.478431, blue: 1 , alpha: 1)
        }else if index == 2
        {
          quickSummary.tintColor = Helper.colors[0]
        }
        else if index == 3
        {
           //setting.tintColor = Helper.colors[0]
        }
        else if index == 4
        {
          //help.tintColor = Helper.colors[0]
        }
    }
   
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if Helper.cardCreatedOrUpdated
        {
            let alertController: UIAlertController = UIAlertController(title: "", message: "", preferredStyle: .Alert)
            
            
            
            let saveActionButton: UIAlertAction = UIAlertAction(title: "Yes", style: .Default)
            { action -> Void in
                Helper.cardCreatedOrUpdated = false
            }
            alertController.addAction(saveActionButton)
            let notSaveActionButton: UIAlertAction = UIAlertAction(title: "No", style: .Default)
            { action -> Void in
                Helper.cardCreatedOrUpdated = false
            }
            alertController.addAction(notSaveActionButton)
            self.presentViewController(alertController, animated: true, completion: nil)
        }
        else
        {
        
        if(indexPath.row == 0)
        {
            
        }
        if(indexPath.row == 1)
        {
            self.performSegueWithIdentifier("newcard", sender: nil)
            switchColor(indexPath.row)
        }
        else if(indexPath.row == 2)
        {
            self.performSegueWithIdentifier("cardlibrary", sender: nil)
            switchColor(indexPath.row)
            
        }
        else if(indexPath.row == 3)
        {
                        switchColor(indexPath.row)
            
        }
        else if(indexPath.row == 4)
        {            switchColor(indexPath.row)
    }
        }
    }
    
  
    
    
}