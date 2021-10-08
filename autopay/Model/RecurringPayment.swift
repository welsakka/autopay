//
//  Groups.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import Foundation

/*
 A model to describe a recurring payment and all the participants in the recurring
 payment.
 
 */
class RecurringPayment {
    
    var name: String?
    var creator: String?
    var id: UUID?
    
    //payer of payment
    var payer: User?
    //Receiver of payment
    var payee: User?
    //Dollar amount that is paid
    var paymentAmount: Float?
    //On what basis the payment will be made
    var paymentFrequency: String?
    //APPLICABLE ONLY TO MONTHLY - day of the month payment will be made
    var paymentDate: Int?
    
}




