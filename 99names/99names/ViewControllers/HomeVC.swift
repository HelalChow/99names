//
//  HomeVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/29/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad()
    {
        super.viewDidLoad()
        let upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleSwipes(_:)))
        upSwipe.direction = .up
        view.addGestureRecognizer(upSwipe)
    }
    @objc func handleSwipes(_ sender:UISwipeGestureRecognizer) {
       performSegue(withIdentifier: "swipe", sender: self)
    }
    
}
