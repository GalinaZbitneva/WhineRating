//
//  AllWinesController.swift
//  Wine
//
//  Created by Галина Збитнева on 06.08.2021.
//

import UIKit



    

class AllWinesController: UITableViewController {
    
  
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("red wine \(allWines.red.count)")
        print("sparkling wine \(allWines.white.count)")
        print("white wine \(allWines.rose.count)")
        print("rose wine \(allWines.sparkling.count)")
        
        allWines.wine.append(contentsOf: allWines.red)
        allWines.wine.append(contentsOf: allWines.white)
        allWines.wine.append(contentsOf: allWines.sparkling)
        allWines.wine.append(contentsOf: allWines.rose)
        
        //Wine.append(contentsOf: allWines.white)
        //Wine.append(contentsOf: allWines.sparkling)
        //Wine.append(contentsOf: allWines.rose)
        
        print(allWines.wine.count)
        print(Wine.count)

        
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return allWines.wine.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wineCell", for: indexPath) as! TableViewCell

        // Configure the cell...
        guard let currentWine = allWines.wine[indexPath.row]?.wine, let currentRatint = allWines.wine[indexPath.row]?.rating.average
, let currentImage = (allWines.wine[indexPath.row]?.image) else {
            return cell
        }
                
        
        //конфигурируем новую ячейк
        cell.wineNameLabel.text = currentWine
        cell.wineRatingLabel.text = currentRatint
        downloadImageUniversal(from: (URL(string: currentImage)!), to: cell.wineImageSmall)
        
        return cell

        // Configure the cell...

       
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

}
