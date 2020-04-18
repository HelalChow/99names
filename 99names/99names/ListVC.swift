//
//  ListVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//
var array = [first]()

import UIKit

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    
    var identity = "memorized"
    public var completionHandler: ((first) -> Void)?
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anonymousFunction = { (fetchedName: first) in
            DispatchQueue.main.async {
                array.append(fetchedName)
                self.tableView.reloadData()
            }
        }
        
        for num in 1...99 {
            fillArray(num: num, completed: anonymousFunction)
        }
         NotificationCenter.default.post(name: Notification.Name("try"), object: array)
        

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
    


    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {

            let payNow = UIContextualAction(style: .normal, title: "Add to Memorized") { (action, view, nil) in
                print("roar")
                NotificationCenter.default.post(name: Notification.Name("element"), object: array[indexPath.row])
                
//                self.array.remove(at: indexPath.row)
//                self.tableView.deleteRows(at: [indexPath], with: .right)
//                self.showAlert(title: "Item Delivered", message: "Transaction Has Been Completed")
            }

            payNow.backgroundColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)

            let config = UISwipeActionsConfiguration(actions: [payNow])
            config.performsFirstActionWithFullSwipe = true
            return config
        }


}
extension ListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        completionHandler?(array[indexPath.row])
//        let vc = storyboard?.instantiateViewController(identifier: "memorized") as! MemorizedVC
//
//        vc.addElement(element: self.array[indexPath.row])
        NotificationCenter.default.post(name: Notification.Name("element"), object: array[indexPath.row])
        
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

