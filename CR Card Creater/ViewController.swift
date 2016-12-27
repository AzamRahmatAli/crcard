//
//  ViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 11/25/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit
import GoogleMobileAds
import CoreData




class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    @IBOutlet weak var shareAndSaveButtonView: UIView!
    @IBOutlet weak var number: UIImageView!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var discription: UILabel!
    
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var border: UIImageView!
    @IBOutlet weak var rarity: UIImageView!
    
    @IBOutlet weak var appStoreAdView: UIView!
    @IBOutlet weak var barButtonItem: UIBarButtonItem!
    var updateCard : Card!
    var tempCard : TempraryCard!
    var attributes : Attributes!
    var nevigationFromNewCard = false
    var bannerView = GADBannerView()
    let imageView = UIImageView(image: UIImage(named: "saving_background"))
    //let appAdForSharingImageView = UIImageView(image: UIImage(named: "edit_layout_add_attribute_button"))

    override func viewDidLoad() {
        super.viewDidLoad()
        appStoreAdView.hidden = true
        barButtonItem.setTitleTextAttributes([
            NSFontAttributeName : UIFont(name: "Supercell-Magic", size: 14)!,
            NSForegroundColorAttributeName : UIColor.whiteColor()],
                                              forState: UIControlState.Normal)
        
        /* self.bannerView.frame = CGRectMake(0, self.view.frame.size.height - 50, 360, 50)
         self.view.addSubview(self.bannerView)
         bannerView.hidden = false
         bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
         bannerView.rootViewController = self
         bannerView.loadRequest(GADRequest())
         
         */
        Helper.loadAd(self, adView: bannerView)
        
     
        
        
        imageView.frame = CGRect(x: 0, y: 0, width: 167, height: 50)
        imageView.center = view.center
        imageView.hidden = true
        view.addSubview(imageView)
        
        //appAdForSharingImageView.frame = CGRect(x: self.view.frame.size.width / 2 - 160, y: self.view.frame.size.height - 50, width: 320, height: 50)
        //appAdForSharingImageView.hidden = true
        //view.addSubview(appAdForSharingImageView)
        
        
        
        Helper.addMenuButton(self)
        if(tempCard == nil)
        {
            tempCard = TempraryCard()
            
            tempCard.name = updateCard.name
            
            tempCard.detail = updateCard.detail
            tempCard.dp = updateCard.dp
            tempCard.rarity = updateCard.rarity
            tempCard.type  = updateCard.type
            tempCard.cost = updateCard.cost
            tempCard.date = updateCard.date
        }
        print(tempCard.name ,tempCard.detail,tempCard.rarity,tempCard.type,tempCard.cost)
        name1.text = tempCard.name
        name2.text = tempCard.name
        discription.text = tempCard.detail
        dp.image = UIImage(data: tempCard.dp!)
        rarity.image = UIImage(named: "label_" + tempCard.rarity! + "_" + tempCard.type!)
        if tempCard.rarity != "legendary"
        {
            border.image = UIImage(named: "card_creator_icon_overlay_normal")
        }
        number.image = UIImage(named: "elixir_" + String(tempCard.cost!) + "_icon")
        
        print(tempCard)
    }
    override func viewWillAppear(animated: Bool) {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
    }
    
    @IBAction func shareButton(sender: UIButton) {
        //Helper.performUIUpdatesOnMain {
        self.shareAndSaveButtonView.hidden = true
        self.navigationController?.navigationBarHidden = true
        bannerView.hidden = true
        appStoreAdView.hidden = false
        //self.appAdForSharingImageView.hidden = false
        // }
        
        /*  let bounds = UIScreen.mainScreen().bounds
         UIGraphicsBeginImageContextWithOptions(bounds.size, true, 0.0)
         self.view.drawViewHierarchyInRect(bounds, afterScreenUpdates: false)
         let img = UIGraphicsGetImageFromCurrentImageContext()
         UIGraphicsEndImageContext()
         let activityViewController = UIActivityViewController(activityItems: [img], applicationActivities: nil)
         self.presentViewController(activityViewController, animated: true, completion: nil)
         */
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(NSEC_PER_SEC / 50))
        dispatch_after(time, dispatch_get_main_queue()) {
            let screen = UIScreen.mainScreen()
            
            if let window = UIApplication.sharedApplication().keyWindow {
                UIGraphicsBeginImageContextWithOptions(screen.bounds.size, false, 0);
                window.drawViewHierarchyInRect(window.bounds, afterScreenUpdates: false)
                let image = UIGraphicsGetImageFromCurrentImageContext();
                UIGraphicsEndImageContext();
                
                let activityViewController = UIActivityViewController(activityItems: [image], applicationActivities: nil)
                
                self.presentViewController(activityViewController, animated: true, completion: nil)
                
            }
                self.appStoreAdView.hidden = true
                self.shareAndSaveButtonView.hidden = false
                self.bannerView.hidden = false
                self.navigationController?.navigationBarHidden = false
                //self.appAdForSharingImageView.hidden = true
            
        }
        
        
        
    }
    
    func assignValues(entity : Card)
    {
        entity.date = tempCard.date
        entity.rarity = tempCard.rarity
        entity.type = tempCard.type
        entity.cost = tempCard.cost
        entity.dp = tempCard.dp
        entity.name = tempCard.name
        entity.detail = tempCard.detail
        entity.attributes = nil // for updating attributes by providing new attributes
        for  (index, name) in attributes.names.enumerate()
        {
            
            
            /* if  let _ = Attribute.attribute(name,objectID : entity.objectID, inManagedObjectContext: managedObjectContext!) where updateCard != nil
             {
             
             }
             else*/ if let sub_entity = NSEntityDescription.insertNewObjectForEntityForName("Attribute", inManagedObjectContext: managedObjectContext!) as? Attribute
             {
                
                sub_entity.name = name
                sub_entity.value = attributes.values[index]
                
                sub_entity.image = attributes.images[index]
                sub_entity.card = entity
                
            }
        }
    }
    @IBAction func saveButton(sender: UIButton) {
        if updateCard != nil
        {
            assignValues(updateCard)
        }
        else if let entity = NSEntityDescription.insertNewObjectForEntityForName("Card", inManagedObjectContext: managedObjectContext!) as? Card
        {
            
            assignValues(entity)
            print("rarity_\(entity.rarity!)")
            Helper.FIRAnalyticsLogEvent("rarity_\(entity.rarity!)", value: "rarity_\(entity.rarity!)")
            Helper.FIRAnalyticsLogEvent("total_cards", value: "total_cards")
            updateCard = entity
        }
        
        do
        {
            try  managedObjectContext?.save()
            Helper.performUIUpdatesOnMain{
                self.imageView.hidden = false
            }
            let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), Int64(NSEC_PER_SEC / 2))
            dispatch_after(time, dispatch_get_main_queue()) {
                
                
                self.imageView.hidden = true
                
            }
            
        }
        catch let error
        {
            print(error)
        }
    }
    
    @IBAction func editCard(sender: UIBarButtonItem) {
        if nevigationFromNewCard
        {
            navigationController?.popViewControllerAnimated(true)
        }
        else
        {
            
            performSegueWithIdentifier("editcard", sender: nil)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editcard"
        {
            let dvc = segue.destinationViewController as! CreateCardViewController
            dvc.attributes = attributes
            dvc.newCard = tempCard
            dvc.updateCard = updateCard
            
        }
    }
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/2.08 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/7
        return collectionViewSize
    }
    
    
    
    //
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return attributes.names.count
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        switch indexPath.row
        {
        case 2,3,6,7,10,11:
            cell.backgroundColor = UIColor.whiteColor();
        default:
            break
        }
        cell.imageView.image = UIImage(named: attributes.images[indexPath.row])
        cell.name.text = attributes.names[indexPath.row]
        let value = attributes.attributeValue(cell.name.text! , value : attributes.values[indexPath.row])
        cell.points.text = value
        cell.pointsd.text = value
        
        return cell
    }
    
}

