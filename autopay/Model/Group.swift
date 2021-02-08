//
//  Groups.swift
//  autopay
//
//  Created by Waleed E on 2/7/21.
//

import Foundation

class Group {
    var groupName : String = ""
    
    func getGroupName() -> String{ return groupName }
    func setGroupName(newName : String) -> String {
        groupName = newName
        return groupName
    }
}




