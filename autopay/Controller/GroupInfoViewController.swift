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
    @IBOutlet var groupTitle: UILabel!
    @IBOutlet var nextPaymentDue: UILabel!
    @IBOutlet var paymentTotal: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTitle.text = myTitle
        paymentTotal.text = myPayment?.description
    }
}
