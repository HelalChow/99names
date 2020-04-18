//
//  object.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation


struct first:Decodable{
    let data: [second]
}

struct second:Decodable {
    let name: String
    let transliteration: String
    let en: third
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String, Any)
    }

//    init(json:[String:Any]) throws {
//        name = json["name"] as? String ?? ""
//        transliteration = json["transliteration"] as? String ?? ""
//        guard let en = json["en"] as? [String:Any] else {throw SerializationError.missing("en is missing")}
////        meaning = en["meaning"] as? String ?? ""
//    }

}

struct third:Decodable {
    let meaning:String
}
