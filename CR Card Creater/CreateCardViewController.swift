//
//  CreateCardViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 11/30/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class CreateCardViewController: UIViewController, UITableViewDataSource, UITableViewDelegate,UIActionSheetDelegate , UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    @IBOutlet weak var tableHeight: NSLayoutConstraint!

    @IBOutlet weak var border: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var cardName: UITextField!
    @IBOutlet weak var discription: UITextField!
    @IBOutlet weak var addAttribute: UIButton!
    @IBOutlet weak var createUpdate: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var rarity: UIImageView!
    @IBOutlet weak var rarityBackground: UIImageView!
    @IBOutlet weak var type: UIImageView!
    @IBOutlet weak var typeBackground: UIImageView!
    @IBOutlet weak var elixirCost: UIImageView!
    
    
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
       reloadTable() 
        // Do any additional setup after loading the view.
    }

    @IBAction func editRarity(sender: UIButton) {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Card Rarity", preferredStyle: .ActionSheet)
        
        
        
        let Common: UIAlertAction = UIAlertAction(title: "Common", style: .Default)
        { action -> Void in
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_common")
            //self.type.image = UIImage(named: "edit_rarity_common")
            self.rarity.image = UIImage(named: "edit_rarity_common")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_common")
        }
        actionSheetControllerIOS8.addAction(Common)
        
        let Rare: UIAlertAction = UIAlertAction(title: "Rare", style: .Default)
        { action -> Void in
            self.rarity.image = UIImage(named: "edit_rarity_rare")
            //self.type.image = UIImage(named: "edit_rarity_background_rare")
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_rare")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_rare")
        }
        actionSheetControllerIOS8.addAction(Rare)
        let Epic: UIAlertAction = UIAlertAction(title: "Epic", style: .Default)
        { action -> Void in
            self.rarity.image = UIImage(named: "edit_rarity_epic")
            //self.type.image = UIImage(named: "edit_rarity_background_epic")
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_epic")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_epic")
        }
        actionSheetControllerIOS8.addAction(Epic)
        
        let Legendary: UIAlertAction = UIAlertAction(title: "Legendary", style: .Default)
        { action -> Void in
            self.rarity.image = UIImage(named: "edit_rarity_legendary")
            //self.type.image = UIImage(named: "edit_rarity_background_legendary")
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_legendary")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_legendary")
            self.border.image = UIImage(named: "edit_card_icon_overlay_legendary")
        }
        actionSheetControllerIOS8.addAction(Legendary)
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
    }
    @IBAction func editType(sender: UIButton) {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Card Type", preferredStyle: .ActionSheet)
        
        
        
        let Troop: UIAlertAction = UIAlertAction(title: "Troop", style: .Default)
        { action -> Void in
            
            self.type.image = UIImage(named: "edit_type_troop")
           
        }
        actionSheetControllerIOS8.addAction(Troop)
        
        let Building: UIAlertAction = UIAlertAction(title: "Building", style: .Default)
        { action -> Void in
            self.type.image = UIImage(named: "edit_type_building")
        }
        actionSheetControllerIOS8.addAction(Building)
        let Spell: UIAlertAction = UIAlertAction(title: "Spell", style: .Default)
        { action -> Void in
            self.type.image = UIImage(named: "edit_type_spell")
        }
        actionSheetControllerIOS8.addAction(Spell)
        
        
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
    }

    @IBAction func costEdit(sender: UIButton) {
    }
    @IBAction func addImage(sender: UIButton) {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Attach receipt image from", preferredStyle: .ActionSheet)
        
        
        
        let saveActionButton: UIAlertAction = UIAlertAction(title: "Camera", style: .Default)
        { action -> Void in
            self.getImageFromCamera()
        }
        actionSheetControllerIOS8.addAction(saveActionButton)
        
        let deleteActionButton: UIAlertAction = UIAlertAction(title: "Photo Library", style: .Default)
        { action -> Void in
            self.getImageFromGallery()
        }
        actionSheetControllerIOS8.addAction(deleteActionButton)
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
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
    
    
    
    func getImageFromGallery() {
        
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .PhotoLibrary
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
     func performUIUpdatesOnMain(updates: () -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            updates()
        }
    }
    
    
    func getImageFromCamera() {
        
        
        
        imagePicker.sourceType = .Camera
        
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        imagePicker.dismissViewControllerAnimated(true, completion: nil)
       /* performUIUpdatesOnMain
            {*/
        self.userImage.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        //}
    }
}
