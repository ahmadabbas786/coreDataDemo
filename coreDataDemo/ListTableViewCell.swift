//
//  ListTableViewCell.swift
//  coreDataDemo
//
//  Created by Amit on 17/09/19.
//  Copyright © 2019 sohel-MAC. All rights reserved.
//

import UIKit

class ListTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblCity: UILabel!
    @IBOutlet weak var lblMobile: UILabel!
    
    var student : Student!{
        didSet{
            lblName.text = student.name
            lblAddress.text = student.address
            lblCity.text = student.city
            lblMobile.text = student.mobile
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
