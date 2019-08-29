//
//  DoctorModel.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 28/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import Foundation

class DoctorModel {
    var fullname: String?
    var speciality: String?
    var price: String?
    var online: String?
    var picture: String?
    var satisfaction: String?
    
    init(fullname: String, speciality: String, price: String, online: String, picture: String, satisfaction: String) {
        self.fullname = fullname
        self.speciality = speciality
        self.price = price
        self.online = online
        self.picture = picture
        self.satisfaction = satisfaction
    }
    
    init(doctor: NSDictionary) {
        self.fullname = doctor["fullname"] as? String
        self.speciality = doctor["speciality"] as? String
        self.price = doctor["price"] as? String
        
        let dataDoctorStatus = doctor["doctor_status"] ?? ""
        let onlineText = (dataDoctorStatus as! [String : AnyObject])["online_text"]
        self.online = onlineText as? String
        
        self.picture = doctor["user_picture_thumbnail"] as? String
        self.satisfaction = doctor["satisfaction"] as? String
    }
    
    public class func modelFromDoctorArray(array: NSArray) -> [DoctorModel] {
        var items = [DoctorModel]()
        for data in array {
            items.append(DoctorModel(doctor: data as! NSDictionary))
        }
        return items
    }
    
}
