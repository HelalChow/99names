//
//  ListVC.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

var array = [first]()

import UIKit
import Firebase

class ListVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var memVCButton: UIButton!
    
    var strNum = "1"
  
    override func viewDidLoad() {
        super.viewDidLoad()
        Analytics.setScreenName("ListVC", screenClass: nil)
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        
//        tableView.estimatedRowHeight = 105.0
//        tableView.rowHeight = UITableView.automaticDimension
        
        
        let anonymousFunction = { (fetchedName: [first]) in
            array = fetchedName
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
//            UserDefaults.standard.storeList(array: array)
//            UserDefaults.standard.changeOnce(value: false)
//            print(array[0])
        }
        
        // check if array API has been called already
//        if let check = UserDefaults.standard.getOnce(), check {
//            array = UserDefaults.standard.getList()
//        } else {
//            for num in 2...99 {
//                strNum = strNum + "," + String(num)
//            }
//            fillArray(num: strNum, completed: anonymousFunction)
//        }
        for num in 2...99 {
            strNum = strNum + "," + String(num)
        }
        fillArray(num: strNum, completed: anonymousFunction)
        
        

        tableView.delegate = self
        tableView.dataSource = self

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        Analytics.logEvent("on_ListVC", parameters: nil)
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
extension ListVC: UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath) as! nameCell
        let isChecked = cell.changeCheck(num: cell.nameLabel.text!)
        
        if isChecked {
            memVCButton.pulsate()
        }
        
    }
}

extension ListVC: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.tableView.register(UINib(nibName: "nameCell", bundle: nil), forCellReuseIdentifier: "nameCell")
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! nameCell
        let name = array[0].data[indexPath.row].transliteration
        let translation = array[0].data[indexPath.row].en.meaning
        let arabic = array[0].data[indexPath.row].name
        cell.setCell(name: name, translation: translation, arabic: arabic, num: String(indexPath.row + 1) + ".")
        
        if let checked = UserDefaults.standard.getValueOfCheck(index: String(name)), checked {
            cell.checkView.isHidden = false
        } else {
            cell.checkView.isHidden = true
        }
        
        return cell
    }
}


