//
//  FoodMenuData.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation

struct FoodMenuData: Decodable {
    
    let headers: [String]
    let categories: [Category]
    
    private enum CodingKeys: String, CodingKey {
        case headers
        case categories
    }
    
    init(from decoder: Decoder) throws  {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        headers = try values.decodeIfPresent([String].self, forKey: .headers) ?? []
        categories = try values.decodeIfPresent([Category].self, forKey: .categories) ?? []
    }
}

