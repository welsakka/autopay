//
//  LoginViewController.swift
//  autopay
//
//  Created by Waleed E on 1/28/21.
//

import UIKit
import Firebase

class LandingViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.

        let testFirebase = TestFirebaseFunctions()
        testFirebase.addMessage(text: "This is a message to Waleed!!")
    }
    
    @IBAction func clickLogin(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "homeView") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func clickRegister(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "register") as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
