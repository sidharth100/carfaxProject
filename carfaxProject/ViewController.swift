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
    var vinArray: [String] = []
    var makeArray : [String] = []
    var phoneArray: [String] = []
    var stateArray: [String] = []
    var cityArray: [String] = []
    var milArray: [Int] = []
    var priceArray: [Double] = []
    var trimArray: [String] = []
    var photourlArray: [URL] = []
    var photourlmArray: [URL] = []
    var photourlsArray: [URL] = []
    var modelArray: [String] = []
    var yearArray: [Int] = []
    
//MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.delegate = self
        tableview.dataSource = self
        tableview.tableFooterView = UIView()
        callingApi()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewComponents()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableview.frame = view.bounds
    }

    //MARK:- API
    
    func callingApi() {
        dataloader.getUsedCars { (result) in
            self.num = 0
            result.map { value in
                value.listings.map { val in
                    if(self.vinArray.contains(val.vin)){
                        self.makeArray.removeAll()
                        self.phoneArray.removeAll()
                        self.stateArray.removeAll()
                        self.cityArray.removeAll()
                        self.milArray.removeAll()
                        self.priceArray.removeAll()
                        self.trimArray.removeAll()
                        self.photourlArray.removeAll()
                        self.photourlsArray.removeAll()
                        self.photourlmArray.removeAll()
                        self.modelArray.removeAll()
                        self.vinArray.removeAll()
                        self.yearArray.removeAll()
                    }
                    self.vinArray.append(val.vin)
                    self.makeArray.append(val.make)
                    self.num = self.makeArray.count
                    self.phoneArray.append(val.dealer.phone)
                    self.stateArray.append(val.dealer.state)
                    self.cityArray.append(val.dealer.city)
                    self.milArray.append(val.mileage)
                    self.priceArray.append(val.listPrice)
                    self.trimArray.append(val.trim)
                    self.photourlArray.append(val.images.firstPhoto.large)
                    self.photourlsArray.append(val.images.firstPhoto.small)
                    self.photourlmArray.append(val.images.firstPhoto.medium)
                    self.modelArray.append(val.model)
                    self.yearArray.append(val.year)
                }
                self.num = self.makeArray.count
                self.tableview.reloadData()
            }
           
            print(result)
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
        return num ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 430
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "CarsViewCell") as! CarsViewCell
        
        cell.getValues(model: modelArray[indexPath.row], make: makeArray[indexPath.row], trim: trimArray[indexPath.row], year: yearArray[indexPath.row], price: priceArray[indexPath.row], mil: milArray[indexPath.row], city: cityArray[indexPath.row], state: stateArray[indexPath.row], phone: phoneArray[indexPath.row], photoUrl: photourlArray[indexPath.row], sphoto: photourlsArray[indexPath.row], mphoto: photourlmArray[indexPath.row])
        
        return cell
    }
    
    
}
