//
//  CreateGroupViewController.swift
//  autopay
//
//  Created by Waleed E on 4/19/21.
//

import UIKit

class CreateGroupViewController: UIViewController {
    
    @IBOutlet var RecurringPaymentName: UITextField!
    @IBOutlet var RecurringPaymentType: UISegmentedControl!
    
    @IBAction func CreateRecurringPaymentButton(_ sender: Any) {
        
        user1.recurringPayments.append(CreateRecurringPayment())
        
        let vc = storyboard?.instantiateViewController(identifier: "homeView") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
 
    //Helper function for creating a new recurring payment instance
    func CreateRecurringPayment() -> RecurringPayment {
        let name = RecurringPaymentName.text
        let type = RecurringPaymentType.selectedSegmentIndex
        
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
        let newMembersArr: [Member] = []
        //Add user who created recurring payment
        let creatorMember = Member()
        creatorMember.memberName = "sample"
        creatorMember.memberID = UUID()
        creatorMember.sendingOrReceiving = type
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }

}
