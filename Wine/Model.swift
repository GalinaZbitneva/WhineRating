//
//  Model.swift
//  Wine
//
//  Created by Галина Збитнева on 05.08.2021.
//

import Foundation
import UIKit


struct Response: Codable {
   var winery: String
   var wine: String
   var rating: Rating
   var location: String
   var image: String
   var id: Int
   
}

struct Rating: Codable {
    var average: Float
    var reviews: String
}



class Wine {
    
    
    var redWine: Response?
    var whiteWine: Response?
    var sparklingWine: Response?
    var roseWine: Response?
    
    let redWineURL = URL(string: "https://api.sampleapis.com/wines/reds")
    let whiteWineURL = URL(string: "https://api.sampleapis.com/wines/whites")
    let sparklingWhineURL = URL(string: "https://api.sampleapis.com/wines/sparkling")
    let roseWhineURL = URL(string: "https://api.sampleapis.com/wines/rose")
    
    
    
    
    
    
    
}
