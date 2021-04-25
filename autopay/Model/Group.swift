//
//  Groups.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import Foundation

//Rename to Recurring Payment?
class Group {
    var groupName: String?
    var groupCreator: String?
    var groupID: UUID?
    var groupMembers: [Member]?
    //frequency in days
    var paymentFrequency: Int?
}




