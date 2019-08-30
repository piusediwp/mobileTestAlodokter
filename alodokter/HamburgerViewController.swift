//
//  HamburgerViewController.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 31/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import UIKit

class HamburgerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "hamburgerBack", sender: self)
    }
}
