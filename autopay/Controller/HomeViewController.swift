//
//  HomeViewController.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet var GroupsStackView: UIStackView!
    var groupsArr : [Group] = []
    
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let netflix = Group()
        let rent = Group()
        
        netflix.setGroupName(newName: "Netflix fam")
        rent.setGroupName(newName: "Rodney's tribute")
        
        groupsArr.append(netflix)
        groupsArr.append(rent)
        
        for group in groupsArr {
            let button = UIButton(frame: CGRect(x: 100, y: 100, width: 100, height: 50))
            button.setTitle(group.groupName, for: .normal)
            button.backgroundColor = getRandomColor()
            GroupsStackView.addArrangedSubview(button)
        }

        GroupsStackView.distribution = .fillEqually
        GroupsStackView.spacing = 25
        
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
