//
//  TestViewController.swift
//  autopay
//
//  Created by Waleed E on 2/4/21.
//

import UIKit

class TestViewController: UIViewController {
    
    var headerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        headerView = UIView()
        headerView.backgroundColor = .red
        self.view.addSubview(headerView)
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
