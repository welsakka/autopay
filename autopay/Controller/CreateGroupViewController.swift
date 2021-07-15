//
//  CreateGroupViewController.swift
//  autopay
//
//  Created by Waleed E on 4/19/21.
//

import UIKit

class CreateGroupViewController: UIViewController, AddMemberDelegate {
    
    @IBOutlet var RecurringPaymentName: UITextField!
    @IBOutlet var MembersStack: UIStackView!
    @IBOutlet var venmoUsername: UITextField!
    @IBOutlet var paymentAmount: UITextField!
    var memberArr: [Member] = []
    
    //Function for when the user wants to add a member to the Rec.Pay.
    @IBAction func AddMemberButton(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "addMemberView") as! CreateGroupAddMemberViewController
        vc.delegate = self
        navigationController?.pushViewController(vc, animated: true)
    }
    
    //Create the Rec.Pay. instance and add it to the User's list of rec.payments
    @IBAction func CreateRecurringPaymentButton(_ sender: Any) {
        user1.recurringPayments.append(CreateRecurringPayment())
        
        let vc = storyboard?.instantiateViewController(identifier: "homeView") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
 
    //Helper function for creating a new recurring payment instance
    func CreateRecurringPayment() -> RecurringPayment {
        let name = RecurringPaymentName.text

        let newRecurringPayment = RecurringPayment()
        newRecurringPayment.id = UUID()
        newRecurringPayment.name = name
        newRecurringPayment.creator = user1.username
        newRecurringPayment.member?.autopayAmount = Float(paymentAmount.text ?? "<no_text")
        newRecurringPayment.member?.memberName = venmoUsername.text
        
        
        return newRecurringPayment
    }
    
    //delegate function to add member to Rec.Pay.
    func addMemberToStack(label: UILabel, member: Member) {
        MembersStack.addArrangedSubview(label)
        memberArr.append(member)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
