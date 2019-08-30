//
//  ViewController.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 27/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backgroundView: UIView!
    @IBOutlet weak var backgroundDokterGratis: UIView!
    @IBOutlet weak var imageDokterGratis: UIImageView!
    @IBOutlet weak var backgroundChatList: UIView!
    @IBOutlet weak var backgroundDokterSpesialis: UIView!
    @IBOutlet weak var hamburgerButton: UIButton!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var backgroundSpeciality: UIView!
    @IBOutlet weak var backgroundSearch: UIView!
    @IBOutlet weak var backgroundHamburger: UIView!
    
    var doctorViewModel: DoctorViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = backgroundView.bounds
        gradientLayer.colors = [UIColor(red: 32/255, green: 106/255, blue: 251/255, alpha: 1).cgColor, UIColor(red: 70/255, green: 176/255, blue: 250/255, alpha: 1).cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.95)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 0.05)
        backgroundView.layer.addSublayer(gradientLayer)
        backgroundView.frame.size.height = 200
        backgroundView.frame.size.width = screenWidth
        
        imageDokterGratis.layer.masksToBounds = true
        imageDokterGratis.layer.cornerRadius = imageDokterGratis.bounds.width / 2
        
        backgroundDokterGratis.layer.cornerRadius = 5
        backgroundDokterGratis.layer.shadowColor = UIColor.black.cgColor
        backgroundDokterGratis.layer.shadowOpacity = 0.5
        backgroundDokterGratis.layer.shadowOffset = CGSize(width: 1, height: 1)
        backgroundDokterGratis.layer.shadowRadius = 2
        
        backgroundDokterSpesialis.layer.cornerRadius = 5
        backgroundDokterSpesialis.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        backgroundChatList.layer.cornerRadius = 5
        backgroundChatList.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        backgroundChatList.layer.shadowColor = UIColor.black.cgColor
        backgroundChatList.layer.shadowOpacity = 0.5
        backgroundChatList.layer.shadowOffset = .zero
        backgroundChatList.layer.shadowRadius = 2
        
        let hamburgerImage = UIImage(named: "menu")
        let hamburgerTintedImage = hamburgerImage?.withRenderingMode(.alwaysTemplate)
        hamburgerButton.setImage(hamburgerTintedImage, for: .normal)
        hamburgerButton.tintColor = UIColor(red: 65 / 255.0, green: 127 / 255.0, blue: 226 / 255.0, alpha: 1.0)
        
        let arrowImage = UIImage(named: "more")
        let arrowTintedImage = arrowImage?.withRenderingMode(.alwaysTemplate)
        arrowButton.setImage(arrowTintedImage, for: .normal)
        arrowButton.tintColor = UIColor(red: 65 / 255.0, green: 127 / 255.0, blue: 226 / 255.0, alpha: 1.0)
    
        let specialityView = UIView(frame: CGRect(x: 0, y: 0, width: backgroundSpeciality.bounds.width, height: 1))
        specialityView.layer.borderWidth = 1.0
        specialityView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        backgroundSpeciality.addSubview(specialityView)
        
        let searchTopView = UIView(frame: CGRect(x: 0, y: 0, width: backgroundSearch.bounds.width, height: 1))
        searchTopView.layer.borderWidth = 1.0
        searchTopView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        backgroundSearch.addSubview(searchTopView)
        
        let searchBottomView = UIView(frame: CGRect(x: 0, y: backgroundSearch.bounds.height-1, width: backgroundSearch.bounds.width, height: 1))
        searchBottomView.layer.borderWidth = 1.0
        searchBottomView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        backgroundSearch.addSubview(searchBottomView)
        
        let hamburgerView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: backgroundHamburger.bounds.height-1))
        hamburgerView.layer.borderWidth = 1.0
        hamburgerView.layer.borderColor = UIColor(red:222/255, green:225/255, blue:227/255, alpha: 1).cgColor
        backgroundHamburger.addSubview(hamburgerView)
        
        doctorViewModel = DoctorViewModel()
        let nib = UINib(nibName: "DoctorTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "itemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func hamburgerDetail(_ sender: Any) {
        performSegue(withIdentifier: "hamburgerDetail", sender: self)
    }
    
    @IBAction func specialityTextButton(_ sender: Any) {
        performSegue(withIdentifier: "specialityDetail", sender: self)
    }
    
    @IBAction func specialityIconButton(_ sender: Any) {
        performSegue(withIdentifier: "specialityDetail", sender: self)
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (doctorViewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! DoctorTableViewCell
        cell.setupDataFromModel(model: doctorViewModel!.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
