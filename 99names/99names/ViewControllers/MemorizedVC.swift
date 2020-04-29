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
//        memorizedArray = array
                
        
        print(memorizedArray.count)
       

        memTableView.delegate = self
        memTableView.dataSource = self
    }
    

  
}
extension MemorizedVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("hi")
    }
}

extension MemorizedVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        memTableView.register(UINib(nibName: "nameCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! nameCell

        let name = array[0].data[indexPath.row].transliteration
        let translation = array[0].data[indexPath.row].en.meaning
        let arabic = array[0].data[indexPath.row].name
        cell.setCell(name: name, translation: translation, arabic: arabic, num: String(indexPath.row + 1) + ".")
        
        return cell
    }
}
