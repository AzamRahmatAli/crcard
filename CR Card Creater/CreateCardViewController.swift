//
//  CreateCardViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 11/30/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit
import CoreData

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
    
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    
    var newCard : Card!
    
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        
        if let entity = NSEntityDescription.insertNewObjectForEntityForName("Card", inManagedObjectContext: managedObjectContext!) as? Card
        {
        entity.rarity = "common"
        entity.type = "troop"
        entity.cost = "5"
            newCard = entity
        }
        
        
        
        
       reloadTable() 
        // Do any additional setup after loading the view.
    }

    @IBAction func editRarity(sender: UIButton) {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Card Rarity", preferredStyle: .ActionSheet)
        
        
        
        let Common: UIAlertAction = UIAlertAction(title: "Common", style: .Default)
        { action -> Void in
            self.newCard.rarity = "common"
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_common")
            //self.type.image = UIImage(named: "edit_rarity_common")
            self.rarity.image = UIImage(named: "edit_rarity_common")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_common")
            self.border.image = UIImage(named: "edit_card_icon_overlay_normal")
        }
        actionSheetControllerIOS8.addAction(Common)
        
        let Rare: UIAlertAction = UIAlertAction(title: "Rare", style: .Default)
        { action -> Void in
            self.newCard.rarity = "rare"
            self.rarity.image = UIImage(named: "edit_rarity_rare")
            //self.type.image = UIImage(named: "edit_rarity_background_rare")
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_rare")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_rare")
            self.border.image = UIImage(named: "edit_card_icon_overlay_normal")
        }
        actionSheetControllerIOS8.addAction(Rare)
        let Epic: UIAlertAction = UIAlertAction(title: "Epic", style: .Default)
        { action -> Void in
            self.newCard.rarity = "epic"
            self.rarity.image = UIImage(named: "edit_rarity_epic")
            //self.type.image = UIImage(named: "edit_rarity_background_epic")
            self.rarityBackground.image = UIImage(named: "edit_rarity_background_epic")
            self.typeBackground.image = UIImage(named: "edit_rarity_background_epic")
            self.border.image = UIImage(named: "edit_card_icon_overlay_normal")
        }
        actionSheetControllerIOS8.addAction(Epic)
        
        let Legendary: UIAlertAction = UIAlertAction(title: "Legendary", style: .Default)
        { action -> Void in
            self.newCard.rarity = "legendary"
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
  
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createCard"
        {
            let dvc = segue.destinationViewController as! ViewController
            dvc.card = newCard
        }
    }
    @IBAction func editType(sender: UIButton) {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Card Type", preferredStyle: .ActionSheet)
        
        
        
        let Troop: UIAlertAction = UIAlertAction(title: "Troop", style: .Default)
        { action -> Void in
            self.newCard.type = "troop"
            self.type.image = UIImage(named: "edit_type_troop")
           
        }
        actionSheetControllerIOS8.addAction(Troop)
        
        let Building: UIAlertAction = UIAlertAction(title: "Building", style: .Default)
        { action -> Void in
            self.newCard.type = "building"
            self.type.image = UIImage(named: "edit_type_building")
        }
        actionSheetControllerIOS8.addAction(Building)
        let Spell: UIAlertAction = UIAlertAction(title: "Spell", style: .Default)
        { action -> Void in
            
            self.newCard.type = "spell"
            self.type.image = UIImage(named: "edit_type_spell")
        }
        actionSheetControllerIOS8.addAction(Spell)
        
        
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
    }

    @IBAction func costEdit(sender: UIButton) {
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Elixir Cost", preferredStyle: .ActionSheet)
        
        
        for value in 1...10
        {
        let Troop: UIAlertAction = UIAlertAction(title: String(value), style: .Default)
        { action -> Void in
            self.newCard.cost = String(value)
            self.elixirCost.image = UIImage(named: "elixir_" + String(value) + "_icon")
            
        }
        actionSheetControllerIOS8.addAction(Troop)
        
        }
        
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
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
        newCard.name = cardName.text
        newCard.detail = discription.text
        performSegueWithIdentifier("createCard", sender: nil)
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
        newCard.dp = UIImageJPEGRepresentation(self.userImage.image!, 1.0)//back by UIImage(data: imageData)
        //}
    }
}
