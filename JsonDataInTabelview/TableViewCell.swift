//
//  TableViewCell.swift
//  JsonDataInTabelview
//
//  Created by Anil on 7/18/19.
//  Copyright © 2019 kesarwani. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var label: UILabel!
    

    @IBOutlet weak var imageCharacter: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
