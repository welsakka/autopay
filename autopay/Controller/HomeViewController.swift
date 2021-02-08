//
//  HomeViewController.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    var groupsArr : [Group] = []
    
    @IBOutlet var GroupsStackView: UIStackView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let netflix = Group()
        let rent = Group()
        
        netflix.setGroupName(newName: "Netflix fam")
        rent.setGroupName(newName: "Rodney's tribute")
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
