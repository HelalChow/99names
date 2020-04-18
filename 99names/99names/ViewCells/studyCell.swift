//
//  studyCell.swift
//  99names
//
//  Created by Helal Chowdhury on 4/18/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class studyCell: UICollectionViewCell {
    @IBOutlet weak var arabicLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var translationLabel: UILabel!
    @IBOutlet weak var cntView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        DispatchQueue.main.async {
            self.cntView.layer.shadowColor = UIColor.gray.cgColor
            self.cntView.layer.shadowOpacity = 0.5
            self.cntView.layer.shadowOpacity = 100
            self.cntView.layer.shadowOffset = .zero
            self.cntView.layer.shadowPath = UIBezierPath(rect: self.cntView.bounds).cgPath
            self.cntView.layer.shouldRasterize = true
        }
        
    }

}
