//
//  Model.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 28/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import Foundation

class Model {
    var fullname: String?
    
    init(fullname: String) {
        self.fullname = fullname
    }
    
    init(doctor: NSDictionary) {
        self.fullname = doctor["fullname"] as? String
    }
    
    public class func modelFromDoctorArray(array: NSArray) -> [Model] {
        var items = [Model]()
        for data in array {
            items.append(Model(doctor: data as! NSDictionary))
        }
        return items
    }
    
}
