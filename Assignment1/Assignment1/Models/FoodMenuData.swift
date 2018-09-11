//
//  FoodMenuData.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation

struct FoodMenuData: Decodable {
    
    let categories: [Category]
    
    private enum CodingKeys: String, CodingKey {
        case categories
    }
    
    init(from decoder: Decoder) throws  {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        categories = try values.decodeIfPresent([Category].self, forKey: .categories) ?? []
    }
}

