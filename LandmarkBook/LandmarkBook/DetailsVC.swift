//
//  DetailsVC.swift
//  LandmarkBook
//
//  Created by Enzo Manzo Carelli on 19/06/23.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var selectedLandMarkName = ""
    var selectedLandmarkImage = UIImage()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        landmarkLabel.text = selectedLandMarkName
        imageView.image = selectedLandmarkImage

    }
    


}
