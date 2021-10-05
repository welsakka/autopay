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
    var payer: User?
    var payee: User?
    var paymentAmount: Float?
    var paymentFrequency: String?
    var paymentDate: Int?
    //var member: Member?
    //var members: [Member] = []
    //Used when recurring payment is initially created
    var paymentBeginDate: Date?
    //frequency in days
    
}




