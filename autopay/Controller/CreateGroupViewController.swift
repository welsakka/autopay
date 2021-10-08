//
//  CreateGroupViewController.swift
//  autopay
//
//  Created by Waleed E on 4/19/21.
//

import UIKit

class CreateGroupViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    
    //Initialize variables
    @IBOutlet var RecurringPaymentName: UITextField!
    @IBOutlet var venmoUsername: UITextField!
    @IBOutlet var paymentAmount: UITextField!
    @IBOutlet var paymentFrequency: UIPickerView!
    @IBOutlet var paymentDate: UIPickerView!
    var paymentFrequencyDataSource = ["Monthly"]
    var paymentDateDataSource = Array(1...31)
    
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
        newRecurringPayment.name = name
        newRecurringPayment.creator = user1.username
        newRecurringPayment.id = UUID()
        
        //TODO - will switch out user1 for current user logged in
        newRecurringPayment.payer = user1
        newRecurringPayment.payee = venmoUsername.text
        newRecurringPayment.paymentAmount = Float(paymentAmount.text ?? "<no_text>")
        newRecurringPayment.paymentFrequency = paymentFrequencyDataSource[paymentFrequency.selectedRow(inComponent: 0)]
        newRecurringPayment.paymentDate = paymentDateDataSource[paymentDate.selectedRow(inComponent: 0)]
        
        return newRecurringPayment
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        paymentFrequency.dataSource = self
        paymentFrequency.delegate = self
        paymentDate.dataSource = self
        paymentDate.delegate = self
        
    }
}
