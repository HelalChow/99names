//
//  itemCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/23/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import Gemini
import Firebase

class itemCell: GeminiCell {


    @IBOutlet weak var revealButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    func setData(arabic: String, name: String, meaning: String) {
        self.arabicLabel.text = arabic
        self.nameLabel.text = name
        self.meaningLabel.text = meaning
        self.meaningLabel.isHidden = true
    }

    @IBAction func buttonTapped(_ sender: Any) {
        if self.meaningLabel.isHidden == false{
            self.meaningLabel.isHidden = true
            Analytics.logEvent("meaning_label_hide", parameters: nil)
        }
        else{
            self.meaningLabel.isHidden = false
            Analytics.logEvent("meaning_label_show", parameters: nil)
        }
        
    }
    
}

//https://www.youtube.com/watch?v=FMqX628vE1c
