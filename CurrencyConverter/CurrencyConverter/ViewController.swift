//
//  ViewController.swift
//  CurrencyConverter
//
//  Created by Enzo Manzo Carelli on 18/10/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var CADLabel: UILabel!
    @IBOutlet weak var CHFLabel: UILabel!
    @IBOutlet weak var GBPLabel: UILabel!
    @IBOutlet weak var JPYLabel: UILabel!
    @IBOutlet weak var USDLabel: UILabel!
    @IBOutlet weak var TRYLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func getsRatesClicked(_ sender: Any) {
        // Request & Session
        // Response & Data
        // Parsing & JSON Serialization
        
        let url = URL(string: "http://data.fixer.io/api/latest?access_key=")//add the key after "="  website api fixer.io
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil{
                let alert = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default)
                alert.addAction(okButton)
                self.present(alert, animated: true, completion: nil)
            }else {
                
                if data != nil {
                    do{
                        let jsonResponse = try JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! Dictionary<String, Any>
                        
                        DispatchQueue.main.async {
                            if let rates = jsonResponse["rates"] as? [String : Any]{
                                
                                if let cad = rates["CAD"] as? Double{
                                    self.CADLabel.text = "CAD: \(cad)"
                                }
                                if let chf = rates["CHF"] as? Double{
                                    self.CHFLabel.text = "CHF: \(chf)"
                                }
                                if let gbp = rates["GBP"] as? Double{
                                    self.GBPLabel.text = "GBP: \(gbp)"
                                }
                                if let jpy = rates["JPY"] as? Double{
                                    self.JPYLabel.text = "JPY: \(jpy)"
                                }
                                if let usd = rates["USD"] as? Double{
                                    self.USDLabel.text = "USD: \(usd)"
                                }
                                if let turkish = rates["TRY"] as? Double{
                                    self.TRYLabel.text = "TRY: \(turkish)"
                                }
                                
                            }
                        }
                        
                        
                    }catch{
                        print("error")
                    }
                    
                }
            }
        }
        task.resume()
    }
    
}
