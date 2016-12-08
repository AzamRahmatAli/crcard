//
//  Helper.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/8/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import Foundation
import UIKit

struct Helper
{
    static let colors: [UIColor] = [UIColor(red: 254/255, green: 129/255, blue: 0, alpha: 1),UIColor(red: 38/255, green: 151/255, blue: 213/255, alpha: 1),UIColor(red: 50/255, green: 195/255, blue: 0, alpha: 1),UIColor(red: 255/255, green: 33/255, blue: 67/255, alpha: 1),UIColor(red: 69/255, green: 68/255, blue: 205/255, alpha: 1)]
    
    static func addMenuButton(controller : UIViewController)
    {
        if  controller.revealViewController() != nil {
            //  menuButton.target = self.revealViewController()
            //  menuButton.action = "rightRevealToggle:"
            
            
            let myBtn: UIButton = UIButton()
            myBtn.setImage(UIImage(named: "menu"), forState: .Normal)
            myBtn.frame = CGRectMake(0, 0, 50, 50)
            myBtn.backgroundColor = UIColor.clearColor()
            // myBtn.addTarget(self, action: "rightRevealToggle:", forControlEvents: .TouchUpInside)
            myBtn.addTarget(controller.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            controller.navigationItem.setLeftBarButtonItem(UIBarButtonItem(customView: myBtn), animated: true)
            myBtn.tintColor =  UIColor.whiteColor()
            
            
        }
        
    }

}