//
//  HomeViewController.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import UIKit

public var user1 = User()

class HomeViewController: UIViewController {
    
    @IBOutlet var GroupsStackView: UIStackView!
    @IBOutlet var AddGroupButton: UIButton!
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    //Button to group info view
    @objc func buttonActionToGroupView(sender: UIButton!) {
        let vc = storyboard?.instantiateViewController(identifier: "groupInfoView") as! GroupInfoViewController
        vc.myTitle = user1.recurringPayments[sender.tag].name ?? "ERROR"
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    //button to create group view
    @objc func buttonActionToCreateGroupView(sender: UIButton!) {
        let vc = storyboard?.instantiateViewController(identifier: "createGroupView") as! CreateGroupViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let venmo = SendVenmoPayment()
        venmo.sendVenmoPayment()
        
//      Create User and add the Users groups to the stack view
        user1.username = "MortyIsArmin"
        user1.id = UUID()
        user1.firstName = "Waleed"
        var index = 0
        
        for payment in user1.recurringPayments {
            let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
            button.tag = index
            button.setTitle(payment.name, for: .normal)
            button.backgroundColor = getRandomColor()
            button.addTarget(self, action: #selector(buttonActionToGroupView), for: .touchUpInside)
            GroupsStackView.addArrangedSubview(button)
            index = index + 1
            }
        GroupsStackView.distribution = .fillEqually
        GroupsStackView.spacing = 25
        
        AddGroupButton.addTarget(self, action: #selector(buttonActionToCreateGroupView), for: .touchUpInside)
    }
    

}
