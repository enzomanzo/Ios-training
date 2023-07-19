//
//  ViewController.swift
//  SimpsonsBook
//
//  Created by Enzo Manzo Carelli on 06/07/23.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var mySimpsons = [Simpsons] ()
    var chosenSimpson : Simpsons?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        
        //SIMPSONS OBJECTS
        
        let homer = Simpsons(name: "Homer Simpson", job: "Nuclear Safety", image: UIImage(named: "Homer_Simpson")!)
        let marge = Simpsons(name: "Marge Simpson", job: "Housewife", image: UIImage(named: "Marge_Simpson")!)
        let bart = Simpsons(name: "Bart Simpson", job: "Student", image: UIImage(named: "Bart_Simpson")!)
        let lisa = Simpsons(name: "Lisa Simpson", job: "Student", image: UIImage(named: "Lisa_Simpson")!)
        let maggie = Simpsons(name: "Maggie Simpson", job: "Baby", image: UIImage(named: "Maggie_Simpson")!)
        
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenSimpson = mySimpsons[indexPath.row]
        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedSimpson = chosenSimpson
            
        }
    }
    
}

