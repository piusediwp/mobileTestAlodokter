//
//  DoctorTableViewCell.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 28/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import UIKit

class DoctorTableViewCell: UITableViewCell {

    @IBOutlet weak var fullnameLabel: UILabel!
    @IBOutlet weak var spesialisLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var doctorImage: UIImageView!
    @IBOutlet weak var onlineView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupDataFromModel(model: DoctorModel) {
        self.fullnameLabel.text = model.fullname
        self.spesialisLabel.text = model.speciality
        
        let priceValue: String? = model.price
        self.priceLabel.text = "Chat Sekarang \(priceValue ?? "")"
        
        let onlineValue: String? = model.online
        if(onlineValue == "Online") {
            self.onlineView.backgroundColor = UIColor(red: 78 / 255.0, green: 184 / 255.0, blue: 59 / 255.0, alpha: 1.0)
        } else {
            self.onlineView.backgroundColor = UIColor(red: 170 / 255.0, green: 170 / 255.0, blue: 170 / 255.0, alpha: 1.0)
        }
        
        let ratingValue: String? = model.satisfaction
        if(ratingValue == "belum ada rating") {
            self.ratingLabel.text = ""
        } else {
            self.ratingLabel.text = model.satisfaction
        }
        
        onlineView.layer.masksToBounds = true
        onlineView.layer.cornerRadius = onlineView.bounds.width / 2
    }
}
