import Foundation
import UIKit
import Firebase

class RecurringPayments {

    func addRecurringPayment(recPay: RecurringPayment){
        
        var functions = Functions.functions()
        
        functions.httpsCallable("addRecurringPayment").call() { result, error in
          if let error = error as NSError? {
            if error.domain == FunctionsErrorDomain {
              let code = FunctionsErrorCode(rawValue: error.code)
              let message = error.localizedDescription
              let details = error.userInfo[FunctionsErrorDetailsKey]
            }
            print("Error is following: \(error)")
          }
          if let data = result?.data as? [String: Any] {
            print (data)
          }
        }

    }
}

