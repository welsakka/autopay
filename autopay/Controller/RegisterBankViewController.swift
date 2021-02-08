//
//  RegisterBankViewController.swift
//  autopay
//
//  Created by Waleed E on 2/1/21.
//

import UIKit

class RegisterBankViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickNext(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "profileView") as! ProfileViewController
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
