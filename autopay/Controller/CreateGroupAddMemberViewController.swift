//
//  CreateGroupAddMemberViewController.swift
//  autopay
//
//  Created by Waleed E on 5/3/21.
//

import UIKit

class CreateGroupAddMemberViewController: UIViewController {
    
    var delegate:AddMemberDelegate?
    @IBOutlet var username: UITextField!
    @IBOutlet var sendingPaymentTo: UITextField!
    @IBOutlet var amount: UITextField!
    
    
    //Return data to CreateGroupViewController
    @IBAction func AddMemberButton(_ sender: Any) {
        let label = UILabel()
        label.text = username.text
        label.textColor = .black
        let member = Member()
        member.memberName = username.text
        member.memberID = UUID()
        member.paymentSendingTo = sendingPaymentTo.text
        member.autopayAmount = Float(amount.text ?? "<no_name>")
        delegate?.addMemberToStack(label: label, member: member)
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
