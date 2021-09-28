//
//  User.swift
//  autopay
//
//  Created by Waleed E on 2/15/21.
//

import Foundation

/*
 A user's metadata
 */
public class User {
    var username: String?
    //temporary store for user's venmo password
    var password: String?
    //find a better data type than string for id's
    var venmoUsername: String?
    var venmoPassword: String?
    var id: UUID?
    var firstName: String?
    var lastName: String?
    var profilePicture: String?
    var recurringPayments: [RecurringPayment] = []
    //var bankAccounts: [bankAccount]?
    //var creditCards: [creditCard]?
        
}
