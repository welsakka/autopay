//
//  SendFakeVenmo.swift
//  autopay
//
//  Created by Waleed E on 5/19/21.
//

import Foundation

class checkRecurringPayments {
    
    //declare blank timer variable
    var timer = Timer()
    
    func startTimer() {
        //in a function or viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: false)
    }

    //new function
    @objc func timerAction(){
        var count = 1
        for payment in user1.recurringPayments{
            print(payment.name! + ": This is payment number" + String(count))
            count = count + 1
        }
    }
}
