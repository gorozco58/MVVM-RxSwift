//
//  Repository.swift
//  RxAlamofireExample
//
//  Created by Giovanny Orozco on 12/28/16.
//  Copyright © 2016 Giovanny Orozco. All rights reserved.
//

import Foundation
import ObjectMapper

class Repository: Mappable {

    var identifier: Int!
    var language: String!
    var url: String!
    var name: String!
    
    required init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        identifier <- map["id"]
        language <- map["language"]
        url <- map["url"]
        name <- map["name"]
    }
}
