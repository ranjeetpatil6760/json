//
//  TableViewCell.swift
//  JSON
//
//  Created by Umbrella Systems on 07/05/18.
//  Copyright © 2018 umbrellasystems. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    
    @IBOutlet weak var myimageview: UIImageView!
    
    @IBOutlet weak var mytitle: UILabel!
    @IBOutlet weak var mydescription: UILabel!
    
    @IBOutlet weak var myauthor: UILabel!
    
    @IBOutlet weak var mydate: UILabel!
    
    
    
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
