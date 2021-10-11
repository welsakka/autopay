import Foundation
import UIKit
import Firebase

class RecurringPayments {

    //function to add recurring payment to firebase db
    func addRecurringPayment(recPay: RecurringPayment){
        
        var functions = Functions.functions()
        
        //TODO - Read how to pass a JSON into a firebase functions call using the call() function
        functions.httpsCallable("addRecurringPayment").call([
            "name": recPay.name,
            "creator": recPay.creator,
            "id": recPay.id,
            "payer": recPay.payer,
            "payee": recPay.payee,
            "paymentAmount": recPay.paymentAmount,
            "paymentFrequency": recPay.paymentFrequency,
            "paymentDate": recPay.paymentDate
        ]) { result, error in
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
    
    //function to get a recurring payment from firebase db using its ID
    func getRecurringPayment(id: UUID) -> RecurringPayment {
        
        var functions = Functions.functions()
        
        return RecurringPayment()
    }
}

