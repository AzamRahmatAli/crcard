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
    var index = 0
    var newCard : Card!
    var attributes = Attributes()
   // var atrName : [String] = []
    //var atrImage: [String] = []
    //var value : [String] = ["500", "150", "1.5sec", "Ground", "5"]
    
    var imagePicker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker.delegate = self
        Helper.addMenuButton(self)
        if newCard == nil
        {
        if let entity = NSEntityDescription.insertNewObjectForEntityForName("Card", inManagedObjectContext: managedObjectContext!) as? Card
        {
            
        entity.rarity = "rare"
        entity.type = "troop"
        entity.cost = "5"
        newCard = entity
            
            }
            
        }
        else
        {
            cardName.text = newCard.name
            discription.text = newCard.detail
            userImage.image = UIImage(data:  newCard.dp!)
            rarity.image = UIImage(named: newCard.rarity!)
            type.image = UIImage(named: newCard.type!)
            elixirCost.image = UIImage(named: newCard.cost!)
            changeRarity(newCard.rarity!)
            
        }
        
         NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(CreateCardViewController.receivedDataNotification(_:)), name: "ReceivedData", object: nil)
        /*for (index, value) in attributes.attriutesAdded.enumerate()
        {
            if value
            {
                
                atrName.append(attributes.name[index])
                atrImage.append(attributes.image[index])
            }
        }*/
        //print(atrName)
        //print(atrImage)
              // Do any additional setup after loading the view.
    }
    func receivedDataNotification(object: AnyObject) {
        let name = attributes.names.removeLast()
        let image = attributes.images.removeLast()
        let value = attributes.values.removeLast()
        attributes.names[index] = name
        attributes.images[index] = image
        attributes.values[index] = value
        reloadTable()
    }
    override func viewWillAppear(animated: Bool) {
     
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        reloadTable()
    }
    @IBAction func editRarity(sender: UIButton) {
        //Create the AlertController and add Its action like button in Actionsheet
        let actionSheetControllerIOS8: UIAlertController = UIAlertController(title: "", message: "Card Rarity", preferredStyle: .ActionSheet)
        
        
        
        let Common: UIAlertAction = UIAlertAction(title: "Common", style: .Default)
        { action -> Void in
            self.changeRarity("common")
        }
        actionSheetControllerIOS8.addAction(Common)
        
        let Rare: UIAlertAction = UIAlertAction(title: "Rare", style: .Default)
        { action -> Void in
            self.changeRarity("rare")
            
        }
        actionSheetControllerIOS8.addAction(Rare)
        let Epic: UIAlertAction = UIAlertAction(title: "Epic", style: .Default)
        { action -> Void in
           self.changeRarity("epic")
        }
        actionSheetControllerIOS8.addAction(Epic)
        
        let Legendary: UIAlertAction = UIAlertAction(title: "Legendary", style: .Default)
        { action -> Void in
            self.changeRarity("legendary")
        }
        actionSheetControllerIOS8.addAction(Legendary)
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
    }
  
    func changeRarity(rarity : String)
    {
        
        newCard.rarity = rarity
        self.rarity.image = UIImage(named: "edit_rarity_" + rarity)
        
        self.rarityBackground.image = UIImage(named: "edit_rarity_background_" + rarity)
        self.typeBackground.image = UIImage(named: "edit_rarity_background_" + rarity)
        if  rarity == "legendary"
        {
            self.border.image = UIImage(named: "edit_card_icon_overlay_legendary")
        }
        else{
        self.border.image = UIImage(named: "edit_card_icon_overlay_normal")
        }
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "createCard"
        {
            let dvc = segue.destinationViewController as! ViewController
            dvc.card = newCard
            dvc.attributes = attributes
        }
        else if segue.identifier == "addAttribute"
        {
            let dvc = segue.destinationViewController as! AttributesTableViewController
            dvc.attributes = attributes
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
        
        let cancelActionButton: UIAlertAction = UIAlertAction(title: "Cancel", style: .Cancel) { action -> Void in
            
        }
        actionSheetControllerIOS8.addAction(cancelActionButton)
        self.presentViewController(actionSheetControllerIOS8, animated: true, completion: nil)
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
        
        for  (index, name) in attributes.names.enumerate()
        {
            if let entity = NSEntityDescription.insertNewObjectForEntityForName("Attribute", inManagedObjectContext: managedObjectContext!) as? Attribute
            {
                
                entity.name = name
                entity.value = attributes.values[index]
                entity.image = attributes.images[index]
                entity.card = newCard
               
            }
        }
        
        do
        {
            try  managedObjectContext?.save()
        }
        catch let error
        {
            print(error)
        }
        performSegueWithIdentifier("createCard", sender: nil)
    }
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return attributes.names.count
    }
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath) as! CustomTableViewCell
     
     // Configure the cell...
        cell.deleteButton.tag = indexPath.row
        cell.editButton.tag = indexPath.row
        
        cell.deleteButton.addTarget(self, action: #selector(CreateCardViewController.deleteRow(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        cell.editButton.addTarget(self, action: #selector(CreateCardViewController.editRow(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
            cell.imgView.image = UIImage(named: attributes.images[indexPath.row])
            cell.name.text = attributes.names[indexPath.row]
            cell.value.text = attributes.values[indexPath.row]
        
        return cell
     }
    
    func deleteRow(sender : UIButton)
    {
        attributes.names.removeAtIndex(sender.tag)
        attributes.images.removeAtIndex(sender.tag)
        attributes.values.removeAtIndex(sender.tag)
        reloadTable()
       
    }
    
    func editRow(sender : UIButton)
    {
        index = sender.tag
        self.attributes.getValueType(attributes.names[ sender.tag], controller : self)
        
        
        
    }
    func reloadTable() {
        print(attributes.names)
        tableHeight.constant = CGFloat(attributes.names.count * 70 )
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
