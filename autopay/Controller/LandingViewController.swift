//
//  LoginViewController.swift
//  autopay
//
//  Created by Waleed E on 1/28/21.
//

import UIKit

class LandingViewController: UIViewController {
    
    let netflix = Groups()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        print (netflix.setGroupName(newName: "Netflix fam"))
    }
    
    @IBAction func clickLogin(_ sender: Any) {
    }
    @IBAction func clickRegister(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "register") as! RegisterViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
