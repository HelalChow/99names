//
//  nameCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class nameCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    
    func setCell(name: String, translation: String, arabic: String){
        nameLabel.text = name
        translationLabel.text = translation
        arabicLabel.text = arabic
    }
    
}
