//
//  ViewController.swift
//  carfaxProject
//
//  Created by Sidharth Mehta on 2021-12-21.
//

import UIKit

class ViewController: UIViewController {
    
// MARK:- Properties
    
    @IBOutlet weak var tableview: UITableView!
    var dataloader = DataLoader()
    
//MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        
        dataloader.getUsedCars { (result) in
            print(result)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewComponents()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }

    //MARK:- API
    

    
 // MARK: - Configure View
    
    func configureViewComponents(){
        navigationItem.title = "CARFAX"
        navigationItem.titleView?.tintColor = UIColor.white
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
       // navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.preservesSuperviewLayoutMargins = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .plain, target: self, action: #selector(handleRefresh))
    }
    
   @objc func handleRefresh() {
        tableview.reloadData()
    }

    
    
}





extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 375
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CarsViewCell") as! CarsViewCell
        return cell
    }
    
    
}
