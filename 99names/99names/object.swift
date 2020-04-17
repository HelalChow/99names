//
//  object.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation

struct object: Codable{
    let name: String
    let transliteration: String
    let meaning: String
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String, Any)
    }

//    init(json:[String:Any]) throws {
//        guard let name = json["name"] as? String else {throw SerializationError.missing("name is missing")}
//        guard let transliteration = json["transliteration"] as? String else {throw SerializationError.missing("name is missing")}
//        guard let meaning = json["meaning"] as? String else {throw SerializationError.missing("name is missing")}
//        self.name = name
//        self.transliteration = transliteration
//        self.meaning = meaning
//    }
//
//    static let basePath = "http://api.aladhan.com/asmaAlHusna/"
//
//    static func getNames(completion: @escaping ([object])) -> ()) {
//        let update = basePath + "1"
//        guard let url = URL()
//    }
}
