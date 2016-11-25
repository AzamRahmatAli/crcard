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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       /* for family: String in UIFont.familyNames()
        {
            print("\(family)")
            for names: String in UIFont.fontNamesForFamilyName(family)
            {
                print("== \(names)")
            }
        }*/
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
        return 12
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
        cell.imageView.image = UIImage(named:"icons_stats_range")
        
        //cell.img?.tintColor = Helper.colors[indexPath.row % 5]
        return cell
    }
    
}

