//
//  Model.swift
//  Wine
//
//  Created by Галина Збитнева on 05.08.2021.
//

import Foundation
import UIKit

struct WineResponse: Codable {
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


struct ParticularWineResponse: Codable {
    var id: Int?
    var name: String?
    var price: Int?
    var rating: Int?
    var image: String?
    var description: String?
    var reviews: [Reviews]?
}

struct Reviews: Codable {
    var id: Int?
    var name: String?
    var rating: Int?
    var text: String?
    var likes: Int?
    var dislikes: Int?
}

class AllWine {
    var wine: [WineResponse?]
    var red: [WineResponse?]
    var white: [WineResponse?]
    var sparkling: [WineResponse?]
    var rose: [WineResponse?]
    
    init(red:[WineResponse?], white:[WineResponse?], sparkling:[WineResponse?],rose:[WineResponse?], wine:[WineResponse?]) {
        self.red = red
        self.white = white
        self.sparkling = sparkling
        self.rose = rose
        self.wine = wine
    }
}
        




extension UIImageView {
    func loadImageFromURL(url: URL){
        DispatchQueue.global().async {
            [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data){
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                    
                }
                
            }
        }
    }
}

/*

private func downloadImageUniversal(from url: URL, to Image: UIImageView) {
    print("download started")
    getData(from: url){data, response, error in
        guard let data = data, error == nil else {
            return
        }
        print("download finished")
        
        DispatchQueue.main.async {
            [weak self] in
            Image.image = UIImage(data: data)
        }
    }
}

 */

func getData (from url: URL, completion: @escaping (Data?, URLResponse?, Error?)->()){
    URLSession.shared.dataTask(with: url, completionHandler: completion).resume()
}
