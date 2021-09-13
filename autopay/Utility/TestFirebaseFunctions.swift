
import Foundation
import UIKit
import Firebase

class TestFirebaseFunctions {

    func addMessage(text: String){
        
        var functions = Functions.functions()
        
        functions.httpsCallable("addMessage").call(["text": text]) { result, error in
          if let error = error as NSError? {
            if error.domain == FunctionsErrorDomain {
              let code = FunctionsErrorCode(rawValue: error.code)
              let message = error.localizedDescription
              let details = error.userInfo[FunctionsErrorDetailsKey]
            }
            print("Error is following: \(error)")
          }
          if let data = result?.data as? [String: Any], let text = data["text"] as? String {
            print (result)
          }
        }

    }
}

