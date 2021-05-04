//
//  CreateGroupAddMemberViewController.swift
//  autopay
//
//  Created by Waleed E on 5/3/21.
//

import UIKit

class CreateGroupAddMemberViewController: UIViewController {
    
    var delegate:AddMemberDelegate?
    
    var text: String?
    @IBOutlet var AddMemberText: UITextField!
    
    @IBAction func AddMemberButton(_ sender: Any) {
        let label = UILabel()
        label.text = AddMemberText.text
        delegate?.addMemberToStack(member: label)
        let vc = storyboard?.instantiateViewController(identifier: "createGroupView") as! CreateGroupViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        text = AddMemberText.text
    }
}
