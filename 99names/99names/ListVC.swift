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
        
//        downloadJSON {
//            self.tableView.reloadData()
//        }
        tableView.delegate = self
        tableView.dataSource = self
        
      

    }
    
//    func downloadJSON(completed: @escaping () -> ()) {
//        let url = URL(string: "http://api.aladhan.com/asmaAlHusna/1")
//
//        URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if error == nil {
//                do {
//                    self.objects = try JSONDecoder().decode([object].self, from: data!)
//                    DispatchQueue.main.async {
//                        completed()
//                    }
//                } catch {
//                    print("JSON Error")
//                }
//            }
//        }.resume()
//
//    }
    

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
//        let name = objects[indexPath.row].status
//        let translation = objects[indexPath.row].meaning
        let name = names[indexPath.row]
        let translation = translations[indexPath.row]
        cell.setCell(name: name, translation: translation, arabic: "")
        
        return cell
    }
}
