//
//  DoctorViewModel.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 28/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import Foundation

class DoctorViewModel {
    
    var items = [DoctorModel]()
    
    init() {
        if let path = Bundle.main.path(forResource: "DoctorData", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let doctor = jsonResult["data"] as? [Any] {
                    self.items = DoctorModel.modelFromDoctorArray(array: doctor as NSArray)
                }
            } catch {
                print("File not found")
            }
        }
    }
}
