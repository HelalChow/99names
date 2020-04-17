//
//  object.swift
//  99names
//
//  Created by Helal Chowdhury on 4/16/20.
//  Copyright © 2020 Helal. All rights reserved.
//

import Foundation

struct object{
    let name: String
    let transliteration: String
    let meaning: String
    let status: String
    
    enum SerializationError:Error{
        case missing(String)
        case invalid(String, Any)
    }
//
//    init(json:[String:Any]) throws {
//        
//    }
}
