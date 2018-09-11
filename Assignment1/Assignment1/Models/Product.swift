//
//  Product.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation

struct Product: Decodable {
    
    let name: String
    let details: String
    let price: String
    let imageUrl: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case details
        case price
        case imageUrl
    }
    
    init(from decoder: Decoder) throws  {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        name = try values.decodeIfPresent(String.self, forKey: .name) ?? ""
        details = try values.decodeIfPresent(String.self, forKey: .details) ?? ""
        price = try values.decodeIfPresent(String.self, forKey: .price) ?? ""
        imageUrl = try values.decodeIfPresent(String.self, forKey: .imageUrl) ?? ""
    }
}
