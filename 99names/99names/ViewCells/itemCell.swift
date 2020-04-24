//
//  itemCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/23/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class itemCell: UICollectionViewCell {

    @IBOutlet weak var arabicLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(text: String) {
        self.arabicLabel.text = text
    }
}

//https://www.youtube.com/watch?v=FMqX628vE1c
