//
//  CreateGroupAddMemberViewController.swift
//  autopay
//
//  Created by Waleed E on 5/3/21.
//

import UIKit

class CreateGroupAddMemberViewController: UIViewController {
    
    var delegate:AddMemberDelegate?
    @IBOutlet var AddMemberText: UITextField!
    
    //Return data to CreateGroupViewController
    @IBAction func AddMemberButton(_ sender: Any) {
        let label = UILabel()
        label.text = AddMemberText.text
        label.textColor = .black
        delegate?.addMemberToStack(member: label)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
