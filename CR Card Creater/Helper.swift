//
//  Helper.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/8/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import Foundation
import GoogleMobileAds
import UIKit

struct Helper
{
    
    static var cardCreatedOrUpdated = false
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
    static func performUIUpdatesOnMain(updates: () -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            updates()
        }
    }
    
    static func loadAd(viewControlleer : UIViewController, adView : GADBannerView)
    {
        
        adView.frame = CGRectMake(viewControlleer.view.frame.size.width / 2 - 160, viewControlleer.view.frame.size.height - 50, 320, 50)
        
        viewControlleer.view.addSubview(adView)
        adView.hidden = false
        adView.adUnitID = StringFor.adMobID.rawValue
        adView.rootViewController = viewControlleer
        adView.loadRequest(GADRequest())
    }
    static func ResizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        
        let widthRatio  = targetSize.width  / image.size.width
        let heightRatio = targetSize.height / image.size.height
        
        // Figure out what our orientation is, and use that to form the rectangle
        var newSize: CGSize
        if(widthRatio > heightRatio) {
            newSize = CGSizeMake(size.width * heightRatio, size.height * heightRatio)
        } else {
            newSize = CGSizeMake(size.width * widthRatio,  size.height * widthRatio)
        }
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRectMake(0, 0, newSize.width, newSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(newSize, false, 1.0)
        image.drawInRect(rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    static func FIRAnalyticsLogEvent(id : String , value : String)
    {
        FIRAnalytics.logEventWithName(kFIREventSelectContent, parameters: [
            kFIRParameterItemID : id as NSObject,
            kFIRParameterContentType : value as NSObject
            ])
    }
}