//
//  SettingVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/29/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit
import MessageUI
import Firebase

class SettingVC: UIViewController {

    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var shareView: UIImageView!
    
    let app = UIApplication.shared
    override func viewDidLoad() {
        super.viewDidLoad()
        if view.frame.width > 500{
            shareButton.isHidden = true
            shareLabel.isHidden = true
            shareView.isHidden = true
        }

    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Analytics.logEvent("on_SettingVC", parameters: nil)
    }
    
    @IBAction func shareClicked(_ sender: Any) {
        Analytics.logEvent("share_btn_clicked", parameters: nil)
        let shareVC = UIActivityViewController(activityItems: ["Join me in memorizing the 99 names of Allah names with: https://itunes.apple.com/us/app/99-names-of-allah-memorize/id1511060662"], applicationActivities: nil)
        shareVC.popoverPresentationController?.sourceView = self.view
        self.present(shareVC, animated: true, completion: nil)
    }
    

    @IBAction func reviewClicked(_ sender: Any) {
        Analytics.logEvent("review_btn_clicked", parameters: nil)
        let appStoreUrl = URL(string: "https://itunes.apple.com/us/app/99-names-of-allah-memorize/id1511060662?action=write-review")!
        app.open(appStoreUrl)
    }
    
    @IBAction func contactClicked(_ sender: Any) {
        Analytics.logEvent("contact_btn_clicked", parameters: nil)
        showMailComposer()
    }
    
    func showMailComposer(){
        guard MFMailComposeViewController.canSendMail() else{
            return
        }
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["hchowdhury3273@hotmail.com"])
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
            return
        }
        controller.dismiss(animated: true)
    }
}
