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
    
}
class LabelWithAdaptiveTextHeight: UILabel {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        font = fontToFitHeight()
    }
    
    // Returns an UIFont that fits the new label's height.
    private func fontToFitHeight() -> UIFont {
        
        var minFontSize: CGFloat = /*DISPLAY_FONT_MINIMUM // CGFloat*/ 4
        var maxFontSize: CGFloat = /*DISPLAY_FONT_BIG     // CGFloat*/ 67
        var fontSizeAverage: CGFloat = 0
        var textAndLabelHeightDiff: CGFloat = 0
        
        while (minFontSize <= maxFontSize) {
            
            fontSizeAverage = minFontSize + (maxFontSize - minFontSize) / 2
            
            // Abort if text happens to be nil
            guard text?.characters.count > 0 else {
                break
            }
            
            if let labelText: NSString = text {
                let labelHeight = frame.size.height
                
                let testStringHeight = labelText.sizeWithAttributes(
                    [NSFontAttributeName: font.fontWithSize(fontSizeAverage)]
                    ).height
                
                textAndLabelHeightDiff = labelHeight - testStringHeight
                
                if (fontSizeAverage == minFontSize || fontSizeAverage == maxFontSize) {
                    if (textAndLabelHeightDiff < 0) {
                        return font.fontWithSize(fontSizeAverage - 1)
                    }
                    return font.fontWithSize(fontSizeAverage)
                }
                
                if (textAndLabelHeightDiff < 0) {
                    maxFontSize = fontSizeAverage - 1
                    
                } else if (textAndLabelHeightDiff > 0) {
                    minFontSize = fontSizeAverage + 1
                    
                } else {
                    return font.fontWithSize(fontSizeAverage)
                }
            }
        }
        return font.fontWithSize(fontSizeAverage)
    }
}