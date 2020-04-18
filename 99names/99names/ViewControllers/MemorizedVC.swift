//
//  MemorizedVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/18/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class MemorizedVC: UIViewController {

    @IBOutlet weak var memTableView: UITableView!
    var memorizedArray = [first]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc = storyboard?.instantiateViewController(identifier: "list") as! ListVC
        
        NotificationCenter.default.addObserver(self, selector: #selector(didGetNotification(_:)), name: Notification.Name("element"), object: nil)
        
        print(memorizedArray.count)
        memTableView.reloadData()

        memTableView.delegate = self
        memTableView.dataSource = self
    }
    
    func addElement(element: first){
        memorizedArray.append(element)
        print(memorizedArray)
        
    }
    
    @objc func didGetNotification(_ notification: Notification) {
        print("something")
        let entry = notification.object as! first
        memorizedArray.append(entry)
    }

  
}
extension MemorizedVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("hello")
    }
}

extension MemorizedVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memorizedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! nameCell

        let name = memorizedArray[indexPath.row].data[0].transliteration
        let translation = memorizedArray[indexPath.row].data[0].en.meaning
        let arabic = memorizedArray[indexPath.row].data[0].name

        cell.setCell(name: name, translation: translation, arabic: arabic)
        
        return cell
    }
}
