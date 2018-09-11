//
//  Category.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation

struct Category: Decodable {
    
    let title: String
    let desc: String
    let imageHref: String
    
    let products: [Product]
    
    private enum CodingKeys: String, CodingKey {
        case title
        case desc
        case imageHref
        case products
    }
    
    init(from decoder: Decoder) throws  {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        title = try values.decodeIfPresent(String.self, forKey: .title) ?? ""
        desc = try values.decodeIfPresent(String.self, forKey: .desc) ?? ""
        imageHref = try values.decodeIfPresent(String.self, forKey: .imageHref) ?? ""
        products = try values.decodeIfPresent([Product].self, forKey: .products) ?? []
    }
}
