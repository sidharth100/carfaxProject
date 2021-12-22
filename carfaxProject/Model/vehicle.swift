//
//  vehicle.swift
//  carfaxProject
//
//  Created by Sidharth Mehta on 2021-12-21.
//

import Foundation


struct assignment: Codable {
    var listings: [listing]
}

struct listing: Codable {
    
    var dealer : Dealers
    var year : Int
    var make : String
    var model : String
    var trim : String
    var listPrice : Double
    var mileage : Int
    var images: Image
}

struct Image: Codable {
    var large: [URL]
}

struct Dealers: Codable {
    var phone: String
    var state: String
    var city: String
}
