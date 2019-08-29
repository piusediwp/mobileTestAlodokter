//
//  SpecialityModel.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 30/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import Foundation

class SpecialityModel {
    var name: String?
    
    init(name: String) {
        self.name = name
    }
    
    init(speciality: NSDictionary) {
        self.name = speciality["name"] as? String
    }
    
    public class func modelFromSpecialityArray(array: NSArray) -> [SpecialityModel] {
        var items = [SpecialityModel]()
        for data in array {
            items.append(SpecialityModel(speciality: data as! NSDictionary))
        }
        return items
    }
    
}
