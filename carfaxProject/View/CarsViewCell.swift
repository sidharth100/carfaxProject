//
//  CarsViewCell.swift
//  carfaxProject
//
//  Created by Sidharth Mehta on 2021-12-21.
//

import UIKit
import Kingfisher

class CarsViewCell: UITableViewCell {
   

    // MARK:- Properties
    
    @IBOutlet weak var imgLabel: UIImageView!
    @IBOutlet weak var yearNameLabel: UILabel!
    @IBOutlet weak var milLocLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var callButton: UIButton!
    var phonenum : String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
    }

// MARK:- Getting Values from ViewController
    
   
    func getValues(values: listing){

        let source = ImageResource(downloadURL: values.images.firstPhoto.large)
        imgLabel.kf.setImage(with: source)
        
        phonenum = values.dealer.phone
        yearNameLabel.text = "\(values.year)  \(values.make)  \(values.model)  \(values.trim)"
        milLocLabel.text = "\(values.mileage) Mi |  \(values.dealer.city), \(values.dealer.state)"
        priceLabel.text = "$\(String(values.listPrice))"
        
    }
    
// MARK: - Call Dealer Button
    
    @IBAction func onCallPressed(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://\(self.phonenum)") as! NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    }
    
    
}

