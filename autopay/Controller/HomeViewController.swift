//
//  HomeViewController.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var GroupsStackView: UIStackView!
    @IBOutlet var AddGroupButton: UIButton!
    var groupsArr : [Group] = []
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    @objc func buttonActionToGroupView(sender: UIButton!) {
        let vc = storyboard?.instantiateViewController(identifier: "groupOwnerView") as! GroupOwnerViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func buttonActionToCreateGroupView(sender: UIButton!) {
        let vc = storyboard?.instantiateViewController(identifier: "createGroupView") as! CreateGroupViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

//
//        let netflix = Group()
//        let rent = Group()
//
//        netflix.groupName = "Netflix fam"
//        rent.groupName = "Rodney's tribute"
//
//        groupsArr.append(netflix)
//        groupsArr.append(rent)
//
        
//        Create User and add the Users groups to the stack view
        let user1 = User()
        user1.username = "MortyIsArmin"
        user1.id = UUID()
        user1.firstName = "Waleed"
        
        for group in groupsArr {
            let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
            button.setTitle(group.groupName, for: .normal)
            button.backgroundColor = getRandomColor()
            GroupsStackView.addArrangedSubview(button)
            button.addTarget(self, action: #selector(buttonActionToGroupView), for: .touchUpInside)
            
        }
        GroupsStackView.distribution = .fillEqually
        GroupsStackView.spacing = 25
        
        AddGroupButton.addTarget(self, action: #selector(buttonActionToCreateGroupView), for: .touchUpInside)
    }
    

}
