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
        self.onlineView.layer.masksToBounds = true
        self.onlineView.layer.cornerRadius = onlineView.bounds.width / 2
        
        let ratingValue: String? = model.satisfaction
        if(ratingValue == "belum ada rating") {
            self.ratingLabel.text = ""
        } else {
            self.ratingLabel.text = model.satisfaction
        }
        
        let pictureValue: String? = model.picture
        if(pictureValue != "") {
            let URL_IMAGE = URL(string: pictureValue ?? "")
            let session = URLSession(configuration: .default)
            
            let getImageFromUrl = session.dataTask(with: URL_IMAGE!) { (data, response, error) in
                if let e = error {
                    print("Error Occurred: \(e)")
                } else {
                    if (response as? HTTPURLResponse) != nil {
                        if let imageData = data {
                            let image = UIImage(data: imageData)
                            self.doctorImage.image = image
                            self.doctorImage.layer.masksToBounds = true
                            self.doctorImage.layer.cornerRadius = self.doctorImage.bounds.width / 2
                        } else {
                            print("Image file is currupted")
                        }
                    } else {
                        print("No response from server")
                    }
                }
            }
            
            getImageFromUrl.resume()
        }
    }
}
