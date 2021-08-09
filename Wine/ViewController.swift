//
//  ViewController.swift
//  Wine
//
//  Created by Галина Збитнева on 05.08.2021.
//

import UIKit
var Wine: [Response?] = []
var redWine: [Response?] = []
var whiteWine: [Response] = []
var sparklingWine: [Response] = []
var roseWine: [Response] = []

var allWines = AllWine(red: redWine, white: whiteWine, sparkling: sparklingWine, rose: roseWine, wine: Wine)

class ViewController: UIViewController {
    
   
    
    let redWineURL = "https://api.sampleapis.com/wines/reds"
    let whiteWineURL = "https://api.sampleapis.com/wines/whites"
    let sparklingWhineURL = "https://api.sampleapis.com/wines/sparkling"
    let roseWhineURL = "https://api.sampleapis.com/wines/rose"
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        getRedWine(from: redWineURL)
        getWhiteWine(from: whiteWineURL)
        getRoseWine(from: roseWhineURL)
        getSparklingWine(from: sparklingWhineURL)
        
         }
    
    override func viewDidAppear(_ animated: Bool) {
        print("red wine \(allWines.red.count)")
        print("sparkling wine \(sparklingWine.count)")
        print("white wine \(whiteWine.count)")
        print("rose wine \(roseWine.count)")
        print(Wine.count)
    }

    
    
    func getWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [Response]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
                
            }
            catch{
                print("faild to convert")
            }
            guard let json = result else {
                return
            }
            
            Wine.append(contentsOf: json)
           
        })
        task.resume()
        
    }
     

    func getRedWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [Response]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
                
            }
            catch{
                print("faild to convert")
            }
            guard let json = result else {
                return
            }
            
            allWines.red.append(contentsOf: json)
           
        })
        task.resume()
        
    }
     
    func getWhiteWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [Response]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
                
            }
            catch{
                print("faild to convert")
            }
            guard let json = result else {
                return
            }
            
            allWines.white.append(contentsOf: json)
           
        })
        task.resume()
        
    }
     
    func getSparklingWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [Response]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
                
            }
            catch{
                print("faild to convert")
            }
            guard let json = result else {
                return
            }
            
            allWines.sparkling.append(contentsOf: json)
           
        })
        task.resume()
        
    }
    
    func getRoseWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [Response]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([Response].self, from: data)
                
            }
            catch{
                print("faild to convert")
            }
            guard let json = result else {
                return
            }
            
            allWines.rose.append(contentsOf: json)
           
        })
        task.resume()
        
    }
     
     
}

