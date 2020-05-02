//
//  SettingVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/29/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import MessageUI

class SettingVC: UIViewController {

    let app = UIApplication.shared
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func shareClicked(_ sender: Any) {
        let shareVC = UIActivityViewController(activityItems: ["Join me in memorizing the Most Beautiful names with the '99 Names of Allah with this app'"], applicationActivities: nil)
        shareVC.popoverPresentationController?.sourceView = self.view
        self.present(shareVC, animated: true, completion: nil)
    }
    

    @IBAction func reviewClicked(_ sender: Any) {
        let appStoreUrl = URL(string: "https://itunes.apple.com/us/app/waze-navigation-live-traffic/id1511060662?action=write-review")!
        app.open(appStoreUrl)
    }
    
    @IBAction func contactClicked(_ sender: Any) {
        showMailComposer()
    }
    
    func showMailComposer(){
        guard MFMailComposeViewController.canSendMail() else{
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["hchowdhury3273@gmail.com"])
        present(composer, animated: true)
    }
    
    //Lock orientation
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        appUtility.lockOrientation(.portrait)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        appUtility.lockOrientation(.all)
    }
    
    
}

extension SettingVC: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
        }
    }
}
