//
//  CreateGroupViewController.swift
//  autopay
//
//  Created by Waleed E on 4/19/21.
//

import UIKit

class CreateGroupViewController: UIViewController, AddMemberDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //Initialize variables
    @IBOutlet var RecurringPaymentName: UITextField!
    @IBOutlet var venmoUsername: UITextField!
    @IBOutlet var paymentAmount: UITextField!
    var memberArr: [Member] = []
    @IBOutlet var paymentFrequency: UIPickerView!
    @IBOutlet var paymentDate: UIPickerView!
    var paymentFrequencyDataSource = ["Monthly"]
    var paymentDateDataSource = Array(0...31)
    
    //Functions for the Payment frequency pickerview
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == paymentFrequency { return paymentFrequencyDataSource.count }
        else if pickerView == paymentDate { return paymentDateDataSource.count }
        else { return 1 }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == paymentFrequency { return paymentFrequencyDataSource[row] }
        else if pickerView == paymentDate { return String(paymentDateDataSource[row]) }
        else {return "ERROR"}
    }
    
    
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
        newRecurringPayment.paymentAmount = Float(paymentAmount.text ?? "<no_text")
        newRecurringPayment.payer?.memberName = venmoUsername.text
        //newRecurringPayment.paymentFrequency = paymentFrequencyDataSource[paymentFrequency.selectedRow(inComponent: 1)]
        //newRecurringPayment.paymentDate = paymentDateDataSource[paymentDate.selectedRow(inComponent: 1)]
        
        return newRecurringPayment
    }
    
    //delegate function to add member to Rec.Pay.
    func addMemberToStack(label: UILabel, member: Member) {
        //MembersStack.addArrangedSubview(label)
        memberArr.append(member)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentFrequency.dataSource = self
        paymentFrequency.delegate = self
        paymentDate.dataSource = self
        paymentDate.delegate = self
        
    }
}
