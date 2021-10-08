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
    //NON-SECURE STORAGE OF USERNAE/PASSWORD - USE FIREBASE
    var username: String?
    var password: String?
    
    //NON-SECURE STORAGE OF USERNAME/PASSWORD - READ HOW TO STORE IN DATABASE
    var venmoUsername: String?
    var venmoPassword: String?
    
    //User data
    var id: UUID?
    var firstName: String?
    var lastName: String?
    var profilePicture: String?
    var recurringPayments: [RecurringPayment] = []
    
    //TODO
    //var bankAccounts: [bankAccount]?
    //var creditCards: [creditCard]?
        
}
