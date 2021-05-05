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
        newRecurringPayment.members = CreateMembersForNewRecurringPayment()
        
        return newRecurringPayment
    }
    
    //Helper Function for creating new members and adding them to the
    //new recurring payment's member list
    func CreateMembersForNewRecurringPayment() -> [Member] {
        var newMembersArr: [Member] = []
        //Add user who created recurring payment
        let creatorMember = Member()
        creatorMember.memberName = "sample"
        creatorMember.memberID = UUID()
        newMembersArr.append(creatorMember)
        
        return newMembersArr
    }
    
    //delegate function to add member to Rec.Pay.
    func addMemberToStack(member: UILabel) {
        MembersStack.addArrangedSubview(member)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
