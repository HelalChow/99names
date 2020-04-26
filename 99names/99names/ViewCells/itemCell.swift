//
//  itemCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/23/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class itemCell: UICollectionViewCell {


    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(arabic: String, name: String) {
        self.arabicLabel.text = arabic
        self.nameLabel.text = name
    }
}

//https://www.youtube.com/watch?v=FMqX628vE1c
