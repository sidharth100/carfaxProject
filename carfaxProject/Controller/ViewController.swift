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
    var num: Int?{didSet{tableview.reloadData()}}
    var assign = [listing]()
    //var refreshControl: UIRefreshControl?
    
//MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        
        callingApi()
        addRefresh()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewComponents()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }
    
    //MARK: - Pull down to Refresh
    
    func addRefresh() {
        let refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.black
        refreshControl.addTarget(self, action: #selector(handleRefresh), for: .valueChanged)
        tableview.addSubview(refreshControl)
    }

    //MARK:- API
    
    func callingApi() {
        DataLoader.sharedInstance.getUsedCars { data in
            
            if let data = data {
            self.assign = data.listings
                self.tableview.reloadData()
            }
        }
    }

    
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
        self.tableview.reloadData()
    }

    
    
}

//MARK:- TableView

extension ViewController: UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.assign.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CarsViewCell") as! CarsViewCell
        
      cell.getValues(values: self.assign[indexPath.row])
        
        return cell
    }
    
    
}

