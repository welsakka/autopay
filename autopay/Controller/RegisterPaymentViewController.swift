//
//  RegisterPaymentViewController.swift
//  autopay
//
//  Created by Waleed E on 1/30/21.
//

import UIKit

class RegisterPaymentViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickCredit(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "registerCredit") as! RegisterCreditViewController
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func clickBank(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "registerBank") as! RegisterBankViewController
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
