//
//  ProfileViewController.swift
//  autopay
//
//  Created by Waleed E on 2/2/21.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickNext(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "loginView") as! LoginViewController
        navigationController?.pushViewController(vc, animated: true)
    }
}
