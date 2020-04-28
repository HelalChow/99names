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
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var checkView: UIImageView!
    
    var cellImage = ["limeCell", "waterCell", "forestCell", "blueCell"]
    
    func setCell(name: String, translation: String, arabic: String, num: String){
        nameLabel.text = name
        translationLabel.text = translation
        arabicLabel.text = arabic
        cellImageView.image = UIImage(named: cellImage[cellCount % cellImage.count])
        cellCount = cellCount + 1
        numberLabel.text = num
        
    }
    
    func changeCheck(num: String){
        if checkView.isHidden == true{
            checkView.isHidden = false
            UserDefaults.standard.changeCheckMark(value: true, index: num)
        }else{
            checkView.isHidden = true
            UserDefaults.standard.changeCheckMark(value: false, index: num)
        }
        
    }
    
}
