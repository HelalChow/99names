//
//  userDefaults.swift
//  99names
//
//  Created by Helal Chowdhury on 4/28/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation

extension UserDefaults{
    
    func changeCheckMark(value: Bool?, index: String){
        if value != nil{
            UserDefaults.standard.set(value, forKey: index)
        }else{
            UserDefaults.standard.removeObject(forKey: index)
        }
        UserDefaults.standard.synchronize()
    }
    
    func getValueOfCheck(index: String) -> Bool? {
        return UserDefaults.standard.value(forKey: index) as? Bool
    }
    
    
    func storeList(array: [first]?){
        if array != nil{
            UserDefaults.standard.set(array, forKey: "store")
        }
        UserDefaults.standard.synchronize()
    }
    
    func getList() -> [first] {
        return (UserDefaults.standard.value(forKey: "store") as? [first])!
    }
    
    func changeOnce(value: Bool?){
        if value != nil{
            UserDefaults.standard.set(value, forKey: "ready")
        }else{
            UserDefaults.standard.removeObject(forKey: "ready")
        }
        UserDefaults.standard.synchronize()
    }
    
    func getOnce() -> Bool?{
        return UserDefaults.standard.value(forKey: "ready") as? Bool
    }
    
}
