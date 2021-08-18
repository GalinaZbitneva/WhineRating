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
        print(someWine?.price)
        print(wineFromKindOfWine?.rating)
        
        downloadImageUniversal(from: (URL(string: (wineFromKindOfWine?.image)!)!), to: wineImage)
        
        wineRatingLabel.text = String(Double(someWine?.rating ?? 0) / 10.0)
        winePriceLabel.text = "Розничная цена  \(String(someWine?.price ?? 0))  RUR"
        descriptionLabel.text = someWine?.description
        
  
            scroll.delegate = self
            tableReview.delegate = self
            scroll.bounces = false
            tableReview.bounces = false
        tableReview.isScrollEnabled = false

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var wineImage: UIImageView!
    
    @IBOutlet weak var wineRatingLabel: UILabel!
    
    @IBOutlet weak var winePriceLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var scroll: UIScrollView!
    
    @IBOutlet weak var tableReview: UITableView!
    
    @IBOutlet weak var starLabel: UIImageView!
    
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
