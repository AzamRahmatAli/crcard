//
//  Strings.swift
//  budget
//
//  Created by Azam Rahmat on 10/14/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import Foundation

enum StringFor : String
{
    case appName = "CRCard"
    case adMobID = "ca-app-pub-3940256099942544/2934735716"
}

/*//
 //  CardsTableViewController.swift
 //  Guide for clash royal
 //
 //  Created by Azam on 05/05/2016.
 //  Copyright © 2016 Brainload Technologies. All rights reserved.
 //
 
 import UIKit
 import GoogleMobileAds
 
 
 
 class CardsTableViewController: UITableViewController {
 
 var card : Card!
 
 var bannerView = GADBannerView()
 var interstitial: GADInterstitial!
 
 
 override func viewDidLoad() {
 super.viewDidLoad()
 
 
 self.bannerView.frame = CGRectMake(0, self.view.frame.size.height - 50, self.view.frame.size.width, 50)
 //add as subview
 self.view.addSubview(self.bannerView)
 //set proper bottom inset depending on your banner height
 self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 50, 0)
 bannerView.hidden = false
 
 bannerView.adUnitID = "ca-app-pub-2446119148354984/5826923604"
 bannerView.rootViewController = self
 bannerView.loadRequest(GADRequest())
 
 
 
 self.title = card.cardName
 
 if(Admob.firstTime)
 {
 Admob.loadAd()
 Admob.firstTime = false
 }
 else{
 
 interstitial = Admob.interstitial
 if self.interstitial.isReady {
 
 self.interstitial.presentFromRootViewController(self)
 
 Admob.loadAd()
 
 }
 
 }
 // Uncomment the following line to preserve selection between presentations
 // self.clearsSelectionOnViewWillAppear = false
 
 // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
 // self.navigationItem.rightBarButtonItem = self.editButtonItem()
 }
 
 
 override func scrollViewDidScroll(scrollView: UIScrollView) {
 //refresh banner frame during the scrolling
 var bannerFrame: CGRect = self.bannerView.frame
 bannerFrame.origin.y = self.view.frame.size.height - 50 + self.tableView.contentOffset.y
 self.bannerView.frame = bannerFrame
 }
 
 // MARK: - Table view data source
 
 /* override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
 // #warning Incomplete implementation, return the number of sections
 return 0
 }*/
 
 override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 // #warning Incomplete implementation, return the number of rows
 return card.label.count
 }
 
 
 override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomTableViewCell
 
 
 cell.txt.text = card.text[indexPath.row]
 cell.label.text = card.label[indexPath.row]
 cell.img.image = UIImage(named: card.image[indexPath.row])
 // Configure the cell...
 
 return cell
 }
 
 @IBAction func drawerToggle(sender: UIBarButtonItem) {
 
 if let drawerController = navigationController?.parentViewController as? KYDrawerController {
 drawerController.setDrawerState(.Opened, animated: true)
 }
 }
 
 
 
 var valueToPass:String!
 
 override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
 // println("You selected cell #\(indexPath.row)!")
 
 // Get Cell Label
 let indexPath = tableView.indexPathForSelectedRow!
 let currentCell = tableView.cellForRowAtIndexPath(indexPath)! as! CustomTableViewCell
 
 valueToPass = currentCell.label.text
 performSegueWithIdentifier("detail", sender: self)
 
 }
 
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?){
 let path = self.tableView.indexPathForSelectedRow!
 if (segue.identifier == "detail") {
 
 // initialize new view controller and cast it as your view controller
 let detailTVC = segue.destinationViewController as! DetailTableViewController
 // your new view controller should have property that will store passed value
 detailTVC.navBarTitle = card.label[path.row]
 detailTVC.detail = card.detail[card.label[path.row]]!
 }
 
 }
 
 /*
 // Override to support conditional editing of the table view.
 override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the specified item to be editable.
 return true
 }
 */
 
 /*
 // Override to support editing the table view.
 override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
 if editingStyle == .Delete {
 // Delete the row from the data source
 tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
 } else if editingStyle == .Insert {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */
 
 /*
 // Override to support rearranging the table view.
 override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
 
 }
 */
 
 /*
 // Override to support conditional rearranging of the table view.
 override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
 // Return false if you do not want the item to be re-orderable.
 return true
 }
 */
 
 /*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
 
 }
*/