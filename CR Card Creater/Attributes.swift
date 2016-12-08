//
//  Attributes.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/5/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import Foundation
import UIKit


class Attributes {
    
     
    var names : [String] = ["Hitpoints", "Damage", "Hit Speed", "Targets", "Range"]
    var images : [String] = ["icons_stats_hitpoints", "icons_stats_damage", "icons_stats_hit_speed", "icons_stats_targets", "icons_stats_range"]
    var values : [String] = ["500", "150", "1.5", "Ground", "5"]
     let nameAll : [String] = ["Hitpoints","Shield Hitpoints", "Damage Per Second", "Damage", "Area Damage", "Death Damage", "Crown Tower Damage", "Hit Speed", "Targets", "Deploy Time", "Speed", "Range", "Duration", "Radius", "Lifetime" , "Stun Duration", "Spawn Speed", "Count", "Boost", "Rage Effect", "Freeze Duration"]
     let imageAll : [String] = ["icons_stats_hitpoints","icons_stats_shield_hitpoints", "icons_stats_damage_per_second", "icons_stats_damage", "icons_stats_area_damage", "icons_stats_death_damage", "icons_stats_crown_tower_damage", "icons_stats_hit_speed", "icons_stats_targets", "icons_stats_deploy_time", "icons_stats_speed", "icons_stats_range", "icons_stats_spawn_speed", "icons_stats_radius", "icons_stats_spawn_speed" , "icons_stats_freeze_duration", "icons_stats_spawn_speed", "icons_stats_count", "icons_stats_boost", "icons_stats_rage_effect", "icons_stats_freeze_duration"]
    
    
    
    func getValueType(name : String , controller : UIViewController)
    {
       
       
        switch name
        {
            
        case nameAll[1],nameAll[2], nameAll[3], nameAll[4], nameAll[5], nameAll[6], nameAll[7], nameAll[9], nameAll[12], nameAll[13],  nameAll[14], nameAll[15], nameAll[16], nameAll[17], nameAll[18], nameAll[19], nameAll[20], nameAll[0]  :
            
            getValue(name,  controller: controller)
            
        case nameAll[8], nameAll[10], nameAll[11] :
            
            getOtherValue(name, controller: controller)
            
       
            
            
        default :
            break
        }
    }
    
    func getOtherValue(name : String, controller : UIViewController)
    {
        var values : [String] = []
        
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: name, preferredStyle: .ActionSheet)
        if name == nameAll[8]
        {
            values = ["Air", "Ground", "Air + Ground", "Buildings"]
        }
        else if name == nameAll[10]
        {
            values = ["Very Slow", "Slow", "Medium", "Fast", "Very Fast"]
        }
        else if name == nameAll[11]
        {
            values = ["Melee", "Range"]
        }
        for value in values
        {
            let Troop: UIAlertAction = UIAlertAction(title: value, style: .Default)
            { action -> Void in
                if value != "Range"
                {
                    self.names.append(name)
                    self.images.append(self.imageAll[self.nameAll.indexOf(name)!])
                    self.values.append(value)
                    
                    if String(controller).containsString("CreateCardViewController")
                    {
                        self.receivedMessageFromServer()
                    }
                    controller.navigationController?.popViewControllerAnimated(true)
                }
                else{
                    self.getValue(name, controller: controller)
                }
                
            }
            actionSheetControllerIOS8.addAction(Troop)
            
        }
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        controller.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
    }

    func getValue(name : String,  controller : UIViewController)
    {
        print(index)
        let alert = UIAlertController(title: name,  message: "", preferredStyle: .Alert)
        
        //2. Add the text field. You can configure it however you need.
        alert.addTextFieldWithConfigurationHandler({ (textField) -> Void in
            textField.text = ""
            textField.placeholder = "Value"
            textField.keyboardType = UIKeyboardType.NumberPad
        })
        let saveAction = UIAlertAction(title: "Save",
                                       style: .Default) { (action: UIAlertAction!) -> Void in
                                        
                                        let textField = alert.textFields![0] as UITextField
                                        
                                        if textField.text != ""
                                        {
                                            self.names.append(name)
                                    
                                            self.images.append(self.imageAll[self.nameAll.indexOf(name)!])
                                            self.values.append(textField.text!)
                                            
                                            if String(controller).containsString("CreateCardViewController")
                                            {
                                               self.receivedMessageFromServer()
                                            }
                                            
                                            controller.navigationController?.popViewControllerAnimated(true)
                                        }
                                        else
                                        {
                                            
                                        }
        }
        
        saveAction.enabled = false
        NSNotificationCenter.defaultCenter().addObserverForName(UITextFieldTextDidChangeNotification, object:alert.textFields?[0],
                                                                queue: NSOperationQueue.mainQueue()) {
                                                                    (notification) -> Void in
                                                                    
                                                                    let textFieldValue = alert.textFields?[0]
                                                                    
                                                                    saveAction.enabled = !textFieldValue!.text!.isEmpty
        }
        
        //3. Grab the value from the text field, and print it when the user clicks OK.
        
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Default, handler: nil))
        alert.addAction(saveAction)
        // 4. Present the alert.
        controller.presentViewController(alert, animated: true, completion: nil)
    }
    
    func receivedMessageFromServer() {
        NSNotificationCenter.defaultCenter().postNotificationName("ReceivedData", object: nil)
    }
}