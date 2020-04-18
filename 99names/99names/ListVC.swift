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
        fillArray{
            print(self.array)
        }

        print(array)
        
        print(array.count)
        tableView.delegate = self
        tableView.dataSource = self

    }
   
    
    func fillArray(completed: @escaping () -> ()) {
        let basePath = "http://api.aladhan.com/asmaAlHusna/"
        let url = basePath + "1"
        let request = URLRequest(url: URL(string: url)!)

        URLSession.shared.dataTask(with: request) { (data, response, err) in

            guard let data = data else {return}
            do {
                self.array = [try JSONDecoder().decode(first.self, from: data)]
                DispatchQueue.main.async {
                    completed()
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
//        let name = names[indexPath.row]
//        let translation = translations[indexPath.row]
        
//        object.getNames() {(results:[object]) in
//            let name = results[0].transliteration
//            let translation = results[0].meaning
//            let arabic = results[0].name
//            cell.setCell(name: name, translation: translation, arabic: arabic)
//        }
        
//        let name = array[indexPath.row].transliteration
//        let translation = array[indexPath.row].meaning
//        let arabic = array[indexPath.row].name
//
//
//
//        cell.setCell(name: name, translation: translation, arabic: arabic)
        
        return cell
    }
}
