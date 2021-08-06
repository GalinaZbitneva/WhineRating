//
//  Model.swift
//  Wine
//
//  Created by Галина Збитнева on 05.08.2021.
//

import Foundation
import UIKit


struct Response: Codable {
   var winery: String?
   var wine: String?
   var rating: Rating
   var location: String?
   var image: String?
   var id: Int?
   
}

struct Rating: Codable {
    var average: String?
    var reviews: String?
}



class Wine {
    
    var Wine: [Response] = []
    var redWine: [Response] = []
    var whiteWine: [Response] = []
    var sparklingWine: [Response] = []
    var roseWine: [Response] = []
    
    let redWineURL = "https://api.sampleapis.com/wines/reds"
    let whiteWineURL = "https://api.sampleapis.com/wines/whites"
    let sparklingWhineURL = "https://api.sampleapis.com/wines/sparkling"
    let roseWhineURL = "https://api.sampleapis.com/wines/rose"
    
    
    
    func getWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [Response]?
            
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
                
            }
            catch{
                print("faild to convert")
            }
            guard let json = result else {
                return
            }
            
            Wine = json
          
        })
        task.resume()
       
    }
    
}
