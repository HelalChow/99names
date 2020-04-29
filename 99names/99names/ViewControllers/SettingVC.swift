//
//  SettingVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/29/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class SettingVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func shareClicked(_ sender: Any) {
        let shareVC = UIActivityViewController(activityItems: ["Join me in memorizing the Most Beautiful names with the '99 Names of Allah with this app'"], applicationActivities: nil)
        shareVC.popoverPresentationController?.sourceView = self.view
        self.present(shareVC, animated: true, completion: nil)
    }
    

}
