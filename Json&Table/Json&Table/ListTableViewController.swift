//
//  ListTableViewController.swift
//  Json&Table
//
//  Created by Enzo Manzo Carelli on 23/10/23.
//

import UIKit

class ListTableViewController: UITableViewController {

    var appArray = [App]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        let urlApi = "https://itunes.apple.com/br/rss/topfreeapplications/limit=10/json"
        
        if let url = URL(string: urlApi){
            let task = session.dataTask(with: url) {data, response, error in
                if error != nil {
                    print("o erro é \(error!)")
                    return
                }else if let jsonData = data {
                    do{
                        let parsedJson = try JSONSerialization.jsonObject(with: jsonData) as! [String:Any]
                        print(parsedJson)
                        guard let feed = parsedJson["feed"] as? [String:Any] else {return}
                        guard let apps = feed["entry"] as? [[String:Any]]else {return}
                        for app in apps {
                            let objApp = App()
                            guard let imname = app["im:name"] as? [String:Any]else {return}
                            guard let nomeApp = imname["label"] as? String else {return}
                            guard let ArrayImage = app["im:image"] as? [Any] else {return}
                            guard let image0 = ArrayImage[0] as? [String:Any] else {return}
                            guard let imgStr = image0["label"] as? String else {return}
                            let myUrl = URL(string: imgStr)
                            let imageData:Data = try Data (contentsOf: myUrl!)
                            let minhaImagem = UIImage(data: imageData)
                            
                            guard let imCategory = app["category"] as? [String:Any] else {return}
                            guard let attributes = imCategory["attributes"] as? [String:Any] else {return}
                            guard let categoryTerm = attributes["term"] as? String else {return}
                            
                            objApp.nome = nomeApp
                            objApp.imageSTR = imgStr
                            objApp.image = minhaImagem
                            objApp.category = categoryTerm   
                            
                            self.appArray.append(objApp)
                        }
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                            
                    }catch{
                        print("erro no Parser:\(error)")
                    }
                }
            }
            task.resume()
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appArray.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        cell.textLabel?.text = appArray[indexPath.row].nome
        cell.imageView?.image = appArray[indexPath.row].image
        cell.detailTextLabel?.text = appArray[indexPath.row].category
        return cell
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

}
