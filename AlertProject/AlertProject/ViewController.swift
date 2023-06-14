//
//  ViewController.swift
//  AlertProject
//
//  Created by Enzo Manzo Carelli on 14/06/23.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var usernameText: UITextField!
    @IBOutlet weak var passwordText: UITextField!
    @IBOutlet weak var password2Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func signUpClicked(_ sender: Any) {
        
//        let alert = UIAlertController(title: "Error", message: "Username already in use", preferredStyle: UIAlertController.Style.alert)
//        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (UIAlertAction) in
//        }
//        alert.addAction(okButton)
//        self.present(alert, animated: true, completion: nil)
//
        if usernameText.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Username is Empty")
        }else if passwordText.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Password is Empty")
        }else if password2Text.text == ""{
            makeAlert(titleInput: "Error", messageInput: "Confirm your password")
        }
        else if passwordText.text != password2Text.text{
            makeAlert(titleInput: "Error", messageInput: "Passwords do not match")
        } else {
            makeAlert(titleInput: "Success", messageInput: "Created")
        }
        
    }
    
    func makeAlert(titleInput :String, messageInput :String){
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        let okButton = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler:  nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
}

