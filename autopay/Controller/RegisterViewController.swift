//
//  RegisterViewController.swift
//  autopay
//
//  Created by Waleed E on 1/28/21.
//

import UIKit

class RegisterViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func username(_ sender: Any) {
    }
    
    @IBAction func password(_ sender: Any) {
    }
    
    @IBAction func confirmPassword(_ sender: Any) {
    }
    
    @IBAction func clickNext(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "homeView") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
