//
//  SpecialityViewModel.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 30/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import Foundation

class SpecialityViewModel {
    
    var items = [SpecialityModel]()
    
    init() {
        if let path = Bundle.main.path(forResource: "SpecialityData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let speciality = jsonResult["doctor_specialities"] as? [Any] {
                    self.items = SpecialityModel.modelFromSpecialityArray(array: speciality as NSArray)
                }
            } catch {
                print("File not found")
            }
        }
    }
}
