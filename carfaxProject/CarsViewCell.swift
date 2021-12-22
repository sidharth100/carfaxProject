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
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    
    
    
    
}
