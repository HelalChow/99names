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
}

struct third:Decodable {
    let meaning:String
}
