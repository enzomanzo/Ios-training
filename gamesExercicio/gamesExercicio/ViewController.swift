//
//  ViewController.swift
//  gamesExercicio
//
//  Created by Enzo Manzo Carelli on 23/08/23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var nomeJogoLbl: UILabel!
    @IBOutlet weak var gameImage: UIImageView!
    
    var nomeJogos:String = ""
    var imagemJogos:UIImage? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        nomeJogoLbl.text = nomeJogos
        gameImage.image = imagemJogos
        
    }


}

