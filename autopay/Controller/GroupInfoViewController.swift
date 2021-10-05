//
//  GroupInfoViewController.swift
//  autopay
//
//  Created by Waleed E on 5/8/21.
//

import UIKit

class GroupInfoViewController: UIViewController {

    var myTitle: String = ""
    var myPayment: Float?
    var paymentDate: Int?
    @IBOutlet var groupTitle: UILabel!
    @IBOutlet var nextPaymentDue: UILabel!
    @IBOutlet var paymentTotal: UILabel!
    @IBOutlet var payee: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTitle.text = myTitle
        paymentTotal.text = myPayment?.description
        
        //construct next payment date to show to user
        let now = Date()
        let nowComponents = Calendar.current.dateComponents([.year, .month, .day], from: now)
        let witnisey = DateComponents(calendar: Calendar.current, year: nowComponents.year, month: nowComponents.month, day: paymentDate)
        let duration = DateComponents(month: 1)
        let nextPaymentDate = Calendar.current.date(byAdding: duration, to: witnisey.date!)
        
        //format date
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .none
        let datetime = formatter.string(from: nextPaymentDate ?? now)
        
        nextPaymentDue.text = datetime
    }
}


