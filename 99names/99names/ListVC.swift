//
//  ListVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    var objects = [object]()
    
    let names = [
        "Ar-Rahman",
        "Ar-Rahim"
    ]
    
    let translations = [
        "The Most Merciful",
        "The Most Gracious"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("fe")
        object.getNames() {(results:[object]) in
            for result in results {
                print("\(result)")
                print("ded")
            }
        }
        
        
        tableView.delegate = self
        tableView.dataSource = self
        
      

    }


}
extension ListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
    }
}

extension ListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! nameCell
        let name = names[indexPath.row]
        let translation = translations[indexPath.row]
        
//        object.getNames() {(results:[object]) in
//            for result in results {
//                self.objects.append(result)
//            }
//        }
//        let name = objects[indexPath.row].transliteration
//        let translation = objects[indexPath.row].meaning
//        let arabic = objects[indexPath.row].name
                
        cell.setCell(name: name, translation: translation, arabic: "arabic")
        
        return cell
    }
}
