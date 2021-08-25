//
//  KindOfWineTableViewController.swift
//  Wine
//
//  Created by Галина Збитнева on 12.08.2021.
//

import UIKit


class KindOfWineTableViewController: UITableViewController {
    var currentURL: String?
   // var selectedWine:[WineResponse?] = []
    var selectedWineCell: WineResponse?
    var particularWine: ParticularWineResponse?
    let particularWineURL = "http://api.2516.ru:8080/api/v1/wine/"

    override func viewDidLoad() {
        super.viewDidLoad()
        selectedWine = []
        if currentURL != nil {
            getWine(from: currentURL!){
                DispatchQueue.main.async {
                    selectedWine = Wine
                    Wine = []
                    self.tableView.reloadData()
                }
        }
        }
        print("selected wine \(selectedWine.count)")
        
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedWine.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "kindOfWineCell", for: indexPath) as! TableViewCell
        
        // Configure the cell...
        guard let currentWine = selectedWine[indexPath.row]?.wine, let currentRatint = selectedWine[indexPath.row]?.rating?.average
, let currentImage = (selectedWine[indexPath.row]?.image) else {
            
            return cell
        }
                
        
        //конфигурируем новую ячейк
        cell.wineNameLabel.text = currentWine
        cell.wineRatingLabel.text = currentRatint
        downloadImageUniversal(from: (URL(string: currentImage)!), to: cell.wineImageSmall)
        
        return cell


    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 130 //or whatever you need
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToParticularWineController" {
            getSomeWine(from: particularWineURL + String(Int.random(in: 0..<101)))
            sleep(2)
            (segue.destination as! ParticularWineViewController).wineFromKindOfWine = selectedWineCell
            (segue.destination as! ParticularWineViewController).someWine = particularWine
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let wineInCell = selectedWine[indexPath.row]
        selectedWineCell = wineInCell
        performSegue(withIdentifier: "goToParticularWineController", sender: self)
    }
    
    
    /*
     
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    func getSomeWine(from url: String){

        let task = URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {[self]data, response, error in
                guard let data = data , error == nil else {
                    print("something went wrong")
                    return
                }
                 //значит получили данные
                var result: ParticularWineResponse?
                
                do{
                    result = try JSONDecoder().decode(ParticularWineResponse.self, from: data)
                    
                }
                catch{
                    print("faild to convert")
                }
                guard let json = result else {
                    return
                }
                
            particularWine = json
           
              
            })
            task.resume()
           
        }

    
    public func downloadImageUniversal(from url: URL, to Image: UIImageView) {
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

}
