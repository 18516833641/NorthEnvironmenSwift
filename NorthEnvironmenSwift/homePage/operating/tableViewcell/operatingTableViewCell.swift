//
//  operatingTableViewCell.swift
//  NorthEnvironmenSwift
//
//  Created by mark on 2020/9/23.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class operatingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var contenLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
