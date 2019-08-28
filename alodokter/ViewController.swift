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
    
    var viewModel: ViewModel?
    
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
        backgroundView.frame.size.height = 300
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
        
        viewModel = ViewModel()
        let nib = UINib(nibName: "DoctorTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "itemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var shouldAutorotate: Bool {
        return false
    }
}

extension ViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (viewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! DoctorTableViewCell
        cell.setupDataFromModel(model: viewModel!.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
}
