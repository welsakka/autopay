//
//  LoginViewController.swift
//  autopay
//
//  Created by Waleed E on 1/28/21.
//

import UIKit

class LandingViewController: UIViewController {
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func clickLogin(_ sender: Any) {
    }
    @IBAction func clickRegister(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "register") as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
