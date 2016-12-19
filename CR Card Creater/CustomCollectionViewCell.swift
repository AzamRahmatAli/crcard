//
//  CustomCollectionViewCell.swift
//  crcard
//
//  Created by Azam Rahmat on 11/23/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class CustomCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var points: UILabel!
    @IBOutlet weak var pointsd: UILabel!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var costImage: UIImageView!
   
    /*override func awakeFromNib() {
        imageView.layer.shadowColor = UIColor.blackColor().CGColor
        imageView.layer.shadowOffset = CGSizeMake(-1, -1)
        imageView.layer.shadowOpacity = 1
        imageView.layer.shadowRadius = 1.0
        imageView.clipsToBounds = false
    }*/
}
