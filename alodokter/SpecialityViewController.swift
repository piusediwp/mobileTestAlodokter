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
    @IBOutlet weak var searchBar: UISearchBar!
    
    var specialityViewModel: SpecialityViewModel?
    
    var isSearch : Bool = false
    var arrData:[String] = []
    var arrFilter:[String] = []
    var speciality : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        specialityViewModel = SpecialityViewModel()
        let countData = specialityViewModel?.items.count ?? 0
        
        for index in 1...countData {
            arrData.append(specialityViewModel!.items[index-1].name ?? "")
        }
        
        let nib = UINib(nibName: "SpecialityTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "itemCell")
        tableView.dataSource = self
        tableView.delegate = self
        searchBar.delegate = self
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
        if(isSearch) {
            return arrFilter.count
        }
        return arrData.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell") as! SpecialityTableViewCell
        
        if(isSearch) {
            cell.setupDataFromModel(name: arrFilter[indexPath.row])
        } else {
            cell.setupDataFromModel(name: arrData[indexPath.row])
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        speciality = specialityViewModel!.items[indexPath.row].name ?? ""
        
        performSegue(withIdentifier: "specialityBack", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let viewController = segue.destination as! ViewController
        viewController.filter = speciality
    }
}

extension SpecialityViewController: UISearchBarDelegate {
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        isSearch = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        isSearch = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if(searchText == "") {
            isSearch = false;
            self.tableView.reloadData()
        } else {
            arrFilter = arrData.filter { $0.lowercased().contains(searchText.lowercased()) }

            if(arrFilter.count == 0){
                isSearch = false;
            } else {
                isSearch = true;
            }
            self.tableView.reloadData()
        }
    }
}
