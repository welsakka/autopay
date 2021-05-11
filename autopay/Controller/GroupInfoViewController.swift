//
//  GroupInfoViewController.swift
//  autopay
//
//  Created by Waleed E on 5/8/21.
//

import UIKit

class GroupInfoViewController: UIViewController {

    var myTitle: String = ""
    @IBOutlet var groupTitle: UILabel!
    @IBOutlet var nextPaymentDue: UILabel!
    @IBOutlet var memberStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        groupTitle.text = myTitle
    }
}
