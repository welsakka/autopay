//
//  CreateGroupViewController.swift
//  autopay
//
//  Created by Waleed E on 4/19/21.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    @IBAction func CreateGroupButton(_ sender: Any) {
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
