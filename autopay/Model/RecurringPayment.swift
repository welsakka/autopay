//
//  Groups.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import Foundation

//Rename to Recurring Payment?
class RecurringPayment {
    var name: String?
    var creator: String?
    var id: UUID?
    var members: [Member] = []
    //Used when recurring payment is initially created
    var paymentBeginDate: Date?
    //frequency in days
    var paymentFrequency: Int?
}




