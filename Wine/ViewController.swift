//
//  ViewController.swift
//  Wine
//
//  Created by Галина Збитнева on 05.08.2021.
//

import UIKit

var Wine: [WineResponse?] = []
var redWine: [WineResponse?] = []
var whiteWine: [WineResponse?] = []
var sparklingWine: [WineResponse?] = []
var roseWine: [WineResponse?] = []

var allWines = AllWine(red: redWine, white: whiteWine, sparkling: sparklingWine, rose: roseWine, wine: Wine)

class ViewController: UIViewController {
    
    let baseUrl = "https://api.sampleapis.com"
    let redWineURL = "/wines/reds"
    let whiteWineURL = "/wines/whites"
    let sparklingWhineURL = "/wines/sparkling"
    let roseWhineURL = "/wines/rose"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       // getRedWine(from: baseUrl + redWineURL)
       // getWhiteWine(from: baseUrl + whiteWineURL)
        //getRoseWine(from: baseUrl + roseWhineURL)
        //getSparklingWine(from: baseUrl + sparklingWhineURL)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "whiteWineSegue" {
            
        getWhiteWine(from: baseUrl + whiteWineURL)
            sleep(2)
            (segue.destination as! KindOfWineTableViewController).selectedWine = allWines.white
        }
        if segue.identifier == "redWineSegue" {
            getRedWine(from: baseUrl + redWineURL)
            sleep(2)
            (segue.destination as! KindOfWineTableViewController).selectedWine = allWines.red
        }
        if segue.identifier == "roseWineSegue" {
            getRoseWine(from: baseUrl + roseWhineURL)
            sleep(2)
            (segue.destination as! KindOfWineTableViewController).selectedWine = allWines.rose
        }
        if segue.identifier == "sparklingWineSegue" {
            getSparklingWine(from: baseUrl + sparklingWhineURL)
            sleep(2)
            (segue.destination as! KindOfWineTableViewController).selectedWine = allWines.sparkling
        }
        
    }
    
    @IBAction func whiteWineTap(_ sender: UITapGestureRecognizer) {
        
        performSegue(withIdentifier: "whiteWineSegue", sender: self)
    }
    
    
    @IBAction func redWineTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "redWineSegue", sender: self)
    }
    
    
    @IBAction func roseWineTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "roseWineSegue", sender: self)
    }
    
    
    @IBAction func sparklingWineTap(_ sender: UITapGestureRecognizer) {
        performSegue(withIdentifier: "sparklingWineSegue", sender: self)
    }
    
    func getWine(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data, error == nil else {
                print("something went wrong")
                return
            }
            //значит получили данные
            var result: [WineResponse]?// имя структуры
            
            do {
                result = try JSONDecoder().decode([WineResponse].self, from: data)
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

    func getRedWine(from url: String) {
        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: { [self]data, response, error in
            guard let data = data , error == nil else {
                print("something went wrong")
                return
            }
             //значит получили данные
            var result: [WineResponse]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([WineResponse].self, from: data)
                
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
            var result: [WineResponse]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([WineResponse].self, from: data)
                
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
            var result: [WineResponse]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([WineResponse].self, from: data)
                
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
            var result: [WineResponse]?// имя структуры
            
            do{
                result = try JSONDecoder().decode([WineResponse].self, from: data)
                
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


