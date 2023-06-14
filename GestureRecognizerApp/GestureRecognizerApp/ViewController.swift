//
//  ViewController.swift
//  GestureRecognizerApp
//
//  Created by Enzo Manzo Carelli on 14/06/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var myLabel: UILabel!
    var isLogo = true
    override func viewDidLoad() {
        super.viewDidLoad()
            
        imageView.isUserInteractionEnabled = true
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(changePic))
        imageView.addGestureRecognizer(gestureRecognizer)
    }

    @objc func changePic(){
        
        if isLogo == true{
            imageView.image = UIImage(named: "bmwCarro")
            myLabel.text = "Monsters"
            isLogo = false
        }else {
            imageView.image = UIImage(named: "bmwLogo")
            myLabel.text = "BMW. Since 1916 creating...."
            isLogo = true
        }
    }

}

