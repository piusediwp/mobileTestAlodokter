//
//  SpecialityViewController.swift
//  alodokter
//
//  Created by Pius Edi Werda Pebriujianta on 30/08/19.
//  Copyright © 2019 Pius Edi Werda Pebriujianta. All rights reserved.
//

import UIKit

class SpecialityViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    var specialityViewModel: SpecialityViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specialityViewModel = SpecialityViewModel()
        let nib = UINib(nibName: "SpecialityTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "itemCell")
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func backButton(_ sender: Any) {
        performSegue(withIdentifier: "specialityBack", sender: self)
    }
}

extension SpecialityViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (specialityViewModel?.items.count)!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! SpecialityTableViewCell
        cell.setupDataFromModel(model: specialityViewModel!.items[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
}
