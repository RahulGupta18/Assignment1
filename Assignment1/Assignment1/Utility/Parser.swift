//
//  Parser.swift
//  Assignment1
//
//  Created by Rahul Gupta on 9/11/18.
//  Copyright © 2018 Rahul Gupta. All rights reserved.
//

import Foundation

class Parser {
    
    static func parseStubData(onSuccess success:(FoodMenuData?)->Void, onError error:(Error)->Void) {
        
        do {
            let path = Bundle.main.path(forResource: "box8_stub", ofType: "json")
            
            let fileContent = try NSString(contentsOfFile: path!, encoding: String.Encoding.ascii.rawValue)
            let encodedString = fileContent.data(using: String.Encoding.utf8.rawValue)! as Data
            let parsedData = try JSONDecoder().decode(FoodMenuData.self, from: encodedString)
            
            success(parsedData)
            
        } catch let err {
            
            print(err)
            error(err)
        }
    }
}
