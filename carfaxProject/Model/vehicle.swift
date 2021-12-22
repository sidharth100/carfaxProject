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
    var vin : String
    
    var trim : String
    var listPrice : Double
    var mileage : Int
    var images: Imagess
}

struct Imagess: Codable {
    var firstPhoto: firstPic
}

struct firstPic: Codable {
    var large: URL
    var medium: URL
    var small: URL
}

struct Dealers: Codable {
    var phone: String
    var state: String
    var city: String
}
