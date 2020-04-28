//
//  quizCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/27/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import Gemini

class quizCell: GeminiCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var meaningLabel: UILabel!
    
    func setData(arabic: String, name: String, meaning: String) {
        self.arabicLabel.text = arabic
        self.nameLabel.text = name
        self.meaningLabel.text = meaning
        self.meaningLabel.isHidden = true
    }
    
    
    
    @IBAction func buttonTapped(_ sender: Any) {
        if self.meaningLabel.isHidden == false{
            self.meaningLabel.isHidden = true
        }
        else{
            self.meaningLabel.isHidden = false
        }
    }
    
    
}

