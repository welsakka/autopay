//
//  User.swift
//  autopay
//
//  Created by Waleed E on 2/15/21.
//

import Foundation

class User {
    var username: String?
    //There must be a better practice than this to store passwords. Even storing in databases as encrypted strings are looked down upon no?
    var password: String?
    //find a better data type than string for id's
    var id: String?
    var firstName: String?
    var profilePicture: String?
    var groups: [Group] = []
    var bankAccounts: [bankAccount] = []
    var creditCards: [creditCard] = []
        
}
