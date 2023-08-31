//
//  ViewController.swift
//  BrasilianTeams
//
//  Created by Enzo Manzo Carelli on 16/08/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var teamLabel: UILabel!
    var nomeTime : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        teamLabel.text = nomeTime
    }


}

