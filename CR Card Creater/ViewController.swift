//
//  ViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 11/25/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit


import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    @IBOutlet weak var number: UIImageView!
    @IBOutlet weak var name2: UILabel!
    @IBOutlet weak var name1: UILabel!
    @IBOutlet weak var discription: UILabel!
   
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var border: UIImageView!
    @IBOutlet weak var rarity: UIImageView!
    
    var card : Card!
    var attributes : Attributes!
    var nevigationFromNewCard = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.addMenuButton(self)
        
        name1.text = card.name
        name2.text = card.name
        discription.text = card.detail
        dp.image = UIImage(data: card.dp!)
        rarity.image = UIImage(named: "label_" + card.rarity! + "_" + card.type!)
        if card.rarity != "legendary"
        {
            border.image = UIImage(named: "card_creator_icon_overlay_normal")
        }
        number.image = UIImage(named: "elixir_" + String(card.cost!) + "_icon")
         
    }
    override func viewWillAppear(animated: Bool) {
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
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
            dvc.newCard = card
 
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

