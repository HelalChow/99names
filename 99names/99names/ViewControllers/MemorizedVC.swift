//
//  MemorizedVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/18/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import UIKit

class MemorizedVC: UIViewController {
    var memorizedArray = [second]()
    @IBOutlet weak var memTableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var counter = 0
        for i in array{
            if let checked = UserDefaults.standard.getValueOfCheck(index: array[0].data[counter].transliteration), checked {
                memorizedArray.append(array[0].data[counter])
            }
            counter = counter + 1
        }
                
               

        memTableView.delegate = self
        memTableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let remove = UIContextualAction(style: .normal, title: "Remove") { (action, view, nil) in
               print("roar")
            self.memorizedArray.remove(at: indexPath.row)
            self.memTableView.deleteRows(at: [indexPath], with: .left)
           }
           let cell = tableView.cellForRow(at: indexPath) as! nameCell
           cell.changeCheck(num: cell.nameLabel.text!)

           remove.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)

           let config = UISwipeActionsConfiguration(actions: [remove])
           config.performsFirstActionWithFullSwipe = true
           return config
    }
    

  
}
extension MemorizedVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        print("hi")
    }
}

extension MemorizedVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memorizedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        memTableView.register(UINib(nibName: "nameCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! nameCell

        let name = memorizedArray[indexPath.row].transliteration
        let translation = memorizedArray[indexPath.row].en.meaning
        let arabic = memorizedArray[indexPath.row].name
//        cell.setCell(name: name, translation: translation, arabic: arabic, num: String(indexPath.row + 1) + ".")
        
        if let checked = UserDefaults.standard.getValueOfCheck(index: String(name)), checked {
            
            cell.setCell(name: name, translation: translation, arabic: arabic, num: String(indexPath.row + 1) + ".")
        } else {
//            cell.checkView.isHidden = true
        }
        
        return cell
    }
}
