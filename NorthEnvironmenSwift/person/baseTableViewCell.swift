//
//  baseTableViewCell.swift
//  NorthEnvironmenSwift
//
//  Created by mac on 2020/8/22.
//  Copyright © 2020 jietingzhang. All rights reserved.
//

import UIKit

class baseTableViewCell: UITableViewCell {

    @IBOutlet weak var headIcon: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var backImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
