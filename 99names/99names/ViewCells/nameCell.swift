//
//  nameCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//
var cellCount = 0

import UIKit

class nameCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var cellImageView: UIImageView!
    
    var cellImage = ["beigeCell", "purpleCell", "pinkCell", "orangeCell"]
    
    func setCell(name: String, translation: String, arabic: String){
        nameLabel.text = name
        translationLabel.text = translation
        arabicLabel.text = arabic
        cellImageView.image = UIImage(named: cellImage[count % cellImage.count])
        cellCount = cellCount + 1
    }
    
}
