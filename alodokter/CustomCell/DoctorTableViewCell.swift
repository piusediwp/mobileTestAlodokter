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
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func setupDataFromModel(model: Model) {
        self.fullnameLabel.text = model.fullname
    }
}
