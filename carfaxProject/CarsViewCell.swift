//
//  CarsViewCell.swift
//  carfaxProject
//
//  Created by Sidharth Mehta on 2021-12-21.
//

import UIKit

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
    
    func getValues(model: String, make: String, trim: String, year: Int, price: Double, mil: Int, city: String, state: String, phone: String, photoUrl: URL, sphoto: URL , mphoto: URL) {
        
        var image: UIImage? = nil
           do {
               let data = try Data(contentsOf: photoUrl, options: [])

               image = UIImage(data: data)
           }
           catch {
                image = UIImage(named: "arrow.triangle.2.circlepath.camera")
           }

        self.imgLabel.image = image
        
        self.phonenum = phone
        yearNameLabel.text = "\(year)  \(make)  \(model)  \(trim)"
        milLocLabel.text = "\(mil)  \(city), \(state)"
        priceLabel.text = "$\(String(price))"
        
    }
    
// MARK: - Call Dealer Button
    
    @IBAction func onCallPressed(_ sender: Any) {
        let url: NSURL = URL(string: "TEL://\(self.phonenum)") as! NSURL
        UIApplication.shared.open(url as URL, options: [:], completionHandler: nil)
        
    }
    
    
}

