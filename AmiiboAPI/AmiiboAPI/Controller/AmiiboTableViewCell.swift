//
//  AmiiboTableViewCell.swift
//  AmiiboAPI
//
//  Created by Álvaro Ávalos Hernández on 7/3/19.
//  Copyright © 2019 Álvaro Ávalos Hernández. All rights reserved.
//

import UIKit

class AmiiboTableViewCell: UITableViewCell {
    
    @IBOutlet var amiiboImageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var seriesLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
