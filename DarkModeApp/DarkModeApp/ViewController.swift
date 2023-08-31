    //
    //  ViewController.swift
    //  DarkModeApp
    //
    //  Created by Enzo Manzo Carelli on 31/08/23.
    //

    import UIKit

    class ViewController: UIViewController {


    @IBOutlet weak var changeButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        if userInterfaceStyle == .dark {
            changeButton.tintColor = UIColor.white
        }else {
            changeButton.tintColor = UIColor.systemBlue
        }
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
            
        let userInterfaceStyle = traitCollection.userInterfaceStyle
        
        
        if userInterfaceStyle == .dark {
            changeButton.tintColor = UIColor.white
        }else {
            changeButton.tintColor = UIColor.systemBlue
        }
    }

}

