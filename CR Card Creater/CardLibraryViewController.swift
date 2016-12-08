//
//  CardLibraryViewController.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/8/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class CardLibraryViewController: UIViewController , UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Helper.addMenuButton(self)
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(animated: Bool) {
        
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        var collectionViewSize = collectionView.frame.size
        collectionViewSize.width = collectionViewSize.width/2.2 //Display Three elements in a row.
        collectionViewSize.height = collectionViewSize.height/2.5
        return collectionViewSize
    }
    
    
    
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAtIndex section: Int) -> CGFloat {
        return 15
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAtIndex section: Int) -> CGFloat {
        
        return 0
    }
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! CustomCollectionViewCell
        
        
        return cell
    }
    

}
