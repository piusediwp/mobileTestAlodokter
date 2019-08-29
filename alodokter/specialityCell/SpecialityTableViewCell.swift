//
//  SpecialityTableViewCell.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 30/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import UIKit

class SpecialityTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupDataFromModel(model: SpecialityModel) {
        self.nameLabel.text = model.name
    }
}
