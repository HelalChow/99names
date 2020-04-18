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
    
    var array = [first]()
    
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
        
        let anonymousFunction = { (fetchedName: first) in
            DispatchQueue.main.async {
                self.array.append(fetchedName)
                self.tableView.reloadData()
            }
        }
        
        for num in 1...99 {
            fillArray(num: num, completed: anonymousFunction)
        }
        

        tableView.delegate = self
        tableView.dataSource = self

    }
   
    
    func fillArray(num: Int, completed: @escaping (first) -> ()) {
        let basePath = "http://api.aladhan.com/asmaAlHusna/"
        let url = basePath + String(num)
        let request = URLRequest(url: URL(string: url)!)

        URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let data = data else {return}
            do {
                let initial = try JSONDecoder().decode(first.self, from: data)
                DispatchQueue.main.async {
                    completed(initial)
                }
            } catch let jsonErr {
                print("Error Serializing json", jsonErr)
            }
        }.resume()
    }
    


}
extension ListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("hello")
    }
}

extension ListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! nameCell

        let name = array[indexPath.row].data[0].transliteration
        let translation = array[indexPath.row].data[0].en.meaning
        let arabic = array[indexPath.row].data[0].name

        cell.setCell(name: name, translation: translation, arabic: arabic)
        
        return cell
    }
}
