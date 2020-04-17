//
//  object.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation


struct object: Decodable{
    let name: String
    let transliteration: String
    let meaning: String
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String, Any)
    }

    init(json:[String:Any]) throws {
        name = json["name"] as? String ?? ""
        transliteration = json["transliteration"] as? String ?? ""
        guard let en = json["en"] as? [String:Any] else {throw SerializationError.missing("en is missing")}
        meaning = en["meaning"] as? String ?? ""
    }

    static let basePath = "http://api.aladhan.com/asmaAlHusna/"

    static func getNames(completion: @escaping ([object]) -> ()) {
        let url = basePath + "1"
        let request = URLRequest(url: URL(string: url)!)
        
        
        URLSession.shared.dataTask(with: request) { (data, response, err) in
            var entry:[object] = []
            guard let data = data else {return}
            do {
                // This line would allow to replace everything else below. And the init
//                let name = try JSONDecoder().decode(object.self, from: data)
                
                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] else {return}
                guard let item = json["data"] as? [[String:Any]] else {print("item not found"); return}

                let name = try object(json: item[0])
                entry.append(name)

                
                
            } catch let jsonErr {
                print("Error Serializing json", jsonErr)
            }
            completion(entry)
           
        }.resume()
    }
}
