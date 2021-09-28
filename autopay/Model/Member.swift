//
//  Member.swift
//  autopay
//
//  Created by Waleed E on 4/23/21.
//

import Foundation

/*
 A class to identify members in a Recurring Payment. Users can be members in multiple
 groups, and therefore, multiple Member instances with the same memberID can be created
 */
class Member {
    //same as User's name
    var memberName: String?
    //Perhaps same as User ID
    var memberID: UUID?
}
