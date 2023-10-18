//
//  ViewController.swift
//  TopFreeApp-Met2-Swift
//
//  Created by Enzo Manzo Carelli on 11/10/23.
//

import UIKit

var topFreeApp: TopAppFeedEntry? = nil


class ViewController: UIViewController {

    @IBOutlet weak var imagem: UIImageView!
    @IBOutlet weak var descricao: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        descricao.text = ""
    }
    func loadTopFreeApp() {
           let jsonUrlString = "https://itunes.apple.com/br/rss/topfreeapplications/limit=1/json"
           guard let url = URL(string: jsonUrlString) else {
               print("Invalid URL")
               return
           }
           
           URLSession.shared.dataTask(with: url) { data, response, error in
               guard let data = data else { return }
               
               do {
                   let appFeed = try JSONDecoder().decode(TopApp.self, from: data)
                   topFreeApp = appFeed.feed.entry

                   if let imageUrlString = topFreeApp?.imImage.first?.label {
                       let appImage = self.loadImage(urlString: imageUrlString)
                       DispatchQueue.main.sync {
                           self.descricao.text = topFreeApp?.summary.label
                           self.imagem.image = appImage
                       }
                   }
               } catch let jsonError {
                   print("Error serializing Json:", jsonError)
               }
           }
           .resume()
       }

       func loadImage(urlString: String) -> UIImage? {
           guard let url = URL(string: urlString) else {
               print("Could not create a URL")
               return nil
           }
           
           var image: UIImage? = nil
           do {
               let data = try Data(contentsOf: url, options: [])
               image = UIImage(data: data)
           } catch {
               print(error.localizedDescription)
           }
           
           return image
       }


    @IBAction func exibir(_ sender: Any) {
        loadTopFreeApp()
    }
}

