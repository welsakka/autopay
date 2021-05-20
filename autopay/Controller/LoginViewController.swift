//
//  LoginViewController.swift
//  autopay
//
//  Created by Waleed E on 2/2/21.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet var usernameField: UITextField!
    @IBOutlet var passwordField: UITextField!
    
    @IBAction func clickLogin(_ sender: Any) {
        if !(usernameField.text!.isEmpty) && !(passwordField.text!.isEmpty) {
            user1.username = usernameField.text
            user1.password = passwordField.text
            let vc = storyboard?.instantiateViewController(identifier: "homeView") as! HomeViewController
            navigationController?.pushViewController(vc, animated: true)
        }
        else {
            print("Enter your Venmo username and password!!!")
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
