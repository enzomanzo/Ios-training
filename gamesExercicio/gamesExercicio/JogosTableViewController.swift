//
//  TableViewController.swift
//  gamesExercicio
//
//  Created by Enzo Manzo Carelli on 23/08/23.
//

import UIKit

class JogosTableViewController: UITableViewController {

    var capa = ["hor", "unc"]
    var nomeJogo = ["Horizon Zero Down" , "Uncharted 4"]
    var studio = ["Guerilla","Naughty Dog"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return nomeJogo.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        cell.textLabel?.text = nomeJogo[indexPath.row]
        cell.accessoryType = .detailButton
        cell.detailTextLabel?.text = studio[indexPath.row]
        cell.imageView?.image = UIImage(named: capa[indexPath.row])
        
        return cell
    }
    

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "tableToDetails", sender: nil)
    }

    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let alerta = UIAlertController(
            title: "Aviso", message: "O Jogo \(nomeJogo[indexPath.row]) tem nota 5", preferredStyle: UIAlertController.Style.alert)
        
        alerta.addAction(UIAlertAction(title: "Fechar", style: UIAlertAction.Style.default))
        
        present(alerta, animated: true)
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            nomeJogo.remove(at: indexPath.row)
            capa.remove(at: indexPath.row)
            studio.remove(at: indexPath.row)
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    

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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let t = segue.destination as! ViewController
        t.nomeJogos = "\(nomeJogo[tableView.indexPathForSelectedRow!.item])\nStudio: \(studio[tableView.indexPathForSelectedRow!.item])"

        t.imagemJogos = UIImage(named: capa[tableView.indexPathForSelectedRow!.item])
        
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

}
