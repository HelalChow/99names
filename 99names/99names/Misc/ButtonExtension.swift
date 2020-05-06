//
//  ButtonExtension.swift
//  99names
//
//  Created by Yasin Ehsan on 5/6/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation
import UIKit

extension UIButton {
    func pulsate() {
        let pulse = CASpringAnimation(keyPath: "transform.scale")
       pulse.duration = 0.4
       pulse.fromValue = 0.8
       pulse.toValue = 1.1
       pulse.autoreverses = true
       pulse.repeatCount = 2
       pulse.initialVelocity = 0.5
       pulse.damping = 1.0
       
       layer.add(pulse, forKey: "pulse")
    }
}
