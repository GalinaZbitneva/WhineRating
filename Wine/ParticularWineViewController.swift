//
//  ParticularWineViewController.swift
//  Wine
//
//  Created by Галина Збитнева on 17.08.2021.
//

import UIKit



class ParticularWineViewController: UIViewController, UIScrollViewDelegate, UITableViewDelegate {
    
    var someWine:ParticularWineResponse?
    var wineFromKindOfWine: WineResponse?
    
    
    let screenHeight = UIScreen.main.bounds.height
    let scrollViewContentHeight = 1200 as CGFloat


    override func viewDidLoad() {
        super.viewDidLoad()
        //добавила эти две сторочки чтобы отображалась даблица
        tableReview.delegate = self
        tableReview.dataSource = self
        
        print(someWine?.price)
        print(wineFromKindOfWine?.rating)
        
        downloadImageUniversal(from: (URL(string: (wineFromKindOfWine?.image)!)!), to: wineImage)
        
        wineRatingLabel.text = String(Double(someWine?.rating ?? 0) / 10.0)
        winePriceLabel.text = "Розничная цена  \(String(someWine?.price ?? 0))  RUR"
        descriptionLabel.text = someWine?.description
        wineTitle.text = wineFromKindOfWine?.wine
        
        
        
  /*
            scroll.delegate = self
            tableReview.delegate = self
            scroll.bounces = false
            tableReview.bounces = false
        tableReview.isScrollEnabled = false
        
        scrollViewDidScrollToTop(scroll)
 */

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var wineImage: UIImageView!
    
    @IBOutlet weak var wineRatingLabel: UILabel!
    
    @IBOutlet weak var winePriceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var tableReview: UITableView!
    
    @IBOutlet weak var starLabel: UIImageView!
    
    @IBOutlet weak var wineTitle: UILabel!
    
    func scrollViewDidScrollToTop(_ scroll: UIScrollView) {
        let yOffset = scroll.contentOffset.y

        if scroll == self.scroll {
            if yOffset >= scrollViewContentHeight - screenHeight {
                scroll.isScrollEnabled = false
                tableReview.isScrollEnabled = true
            }
        }

        if scroll == self.tableReview {
            if yOffset <= 0 {
                self.scroll.isScrollEnabled = true
                self.tableReview.isScrollEnabled = false
            }
        }
    }
    

  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
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

extension ParticularWineViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        tableReview = tableView
        return someWine?.reviews?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableReview = tableView
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableReview = tableView
        let cell = tableReview.dequeueReusableCell(withIdentifier: "particularWineCell", for: indexPath) as! ReviewCellTableViewCell
        
        // Configure the cell...
        guard let currentReviewer = someWine?.reviews?[indexPath.row].name, let currentDescription = someWine?.reviews?[indexPath.row].text
              , let currentRating = someWine?.reviews?[indexPath.row].rating, let currentLikes = someWine?.reviews?[indexPath.row].likes, let currentDislikes = someWine?.reviews?[indexPath.row].dislikes else {
            
            return cell
        }
                
        
        //конфигурируем новую ячейк
        cell.numberOfDislikeLabel.text = String(currentDislikes)
        cell.numberOfLikeLabel.text = String(currentLikes)
        cell.reviewLabel.text = currentDescription
        cell.reviewerNameLabel.text = currentReviewer
        cell.reviewRatingLabel.text = String(currentRating)
        
        return cell


    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableReview = tableView
        return 120 //or whatever you need
    }

    
}
