//
//  CustomCell.swift
//  TopApps
//
//  Created by Alivelu Ravula on 4/23/18.
//  Copyright © 2018 Roja. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var appLbl: UILabel!
    @IBOutlet weak var appImg: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
