//
//  CustomTableViewCell.swift
//  CR Card Creater
//
//  Created by Azam Rahmat on 12/1/16.
//  Copyright © 2016 Brainload Technologies. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var value: UILabel!
    @IBOutlet weak var imgView: UIImageView!


    @IBAction func deleteAttribute(sender: UIButton) {
    }
    @IBAction func editAttribute(sender: UIButton) {
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
