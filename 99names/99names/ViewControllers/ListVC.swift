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
//    var array = [first]()
    
    var strNum = "1"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let anonymousFunction = { (fetchedName: [first]) in
            array = fetchedName
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            print(array[0])
        }
        
        
        for num in 2...99 {
            strNum = strNum + "," + String(num)
        }
        fillArray(num: strNum, completed: anonymousFunction)

        tableView.delegate = self
        tableView.dataSource = self

    }
   
    
    func fillArray(num: String, completed: @escaping ([first]) -> ()) {
        let basePath = "http://api.aladhan.com/asmaAlHusna/"
        let url = basePath + num
        let request = URLRequest(url: URL(string: url)!)
        var total = [first]()

        URLSession.shared.dataTask(with: request) { (data, response, err) in
            guard let data = data else {return}
            do {
                for i in 1...99{
                    let initial = try JSONDecoder().decode(first.self, from: data)
                    total.append(initial)
                }
                
                DispatchQueue.main.async {
                    completed(total)
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

        print("hello")
    }
}

extension ListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! nameCell

        let name = array[0].data[indexPath.row].transliteration
        let translation = array[0].data[indexPath.row].en.meaning
        let arabic = array[0].data[indexPath.row].name

        cell.setCell(name: name, translation: translation, arabic: arabic, num: String(indexPath.row + 1) + ".")
        
        return cell
    }
}

