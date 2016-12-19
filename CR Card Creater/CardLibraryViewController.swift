//
//  CardLibraryViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/8/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit
import CoreData

class CardLibraryViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    var managedObjectContext: NSManagedObjectContext? = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext
    var card : Card!
    var attributes : Attributes = Attributes()
    var cards : [Card]!
    
    @IBAction func deleteCard(sender: UIButton) {
        
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let fetchRequest = NSFetchRequest(entityName: "Card")
        do {
        let cards = try managedObjectContext!.executeFetchRequest(fetchRequest) as! [Card]
        
        // Then you can use your properties.
        
        for card in cards {
            
            if card.objectID.temporaryID
            {
                print(card.objectID.temporaryID)
                self.managedObjectContext!.deleteObject(card)
            }
   
            
        }
        } catch let error as NSError {
            print("Could not fetch \(error)")
        }
        Helper.addMenuButton(self)
        // Do any additional setup after loading the view.
      
        do{
            let request = NSFetchRequest(entityName: "Card")
            
            
            let queryResult = try managedObjectContext?.executeFetchRequest(request) as! [Card]
            cards = queryResult
                        
        }
        catch let error {
            print("error : ", error)
        }

    }
    override func viewWillAppear(animated: Bool) {
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    


    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    if segue.identifier == "displaycard"
    {
        let dvc = segue.destinationViewController as! ViewController
        dvc.attributes = attributes
        dvc.card = card
        
    }
}
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/2.2 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/2.5
        return collectionViewSize
    }
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        attributes.names = []
        attributes.images = []
        attributes.values = []
        card = cards[indexPath.row]
        for attribute in card.attributes?.allObjects as! [Attribute]
        {
            attributes.names.append(attribute.name!)
            attributes.images.append(attribute.image!)
            attributes.values.append(attribute.value!)
        }
        performSegueWithIdentifier("displaycard", sender: nil)
    }
   
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards?.count ?? 0
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
         cell.dp.image = UIImage(data: cards[indexPath.row].dp!)
            cell.costImage.image = UIImage(named: "elixir_\(cards![indexPath.row].cost!)_icon")
            
            cell.name.text = "  " + cards[indexPath.row].name!
        
        
        return cell
    }
    

}
