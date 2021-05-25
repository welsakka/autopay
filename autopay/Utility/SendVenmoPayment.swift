//
//  SendVenmoPayment.swift
//  autopay
//
//  Created by Waleed E on 5/20/21.
//

import Foundation
import UIKit

class SendVenmoPayment {
    
    struct accessToken: Codable {
        let access_token: String
    }
    
    //declare blank timer variable
    var timer = Timer()
    
    func startTimer() {
        //in a function or viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(sendVenmoPayment), userInfo: nil, repeats: false)
    }
    
    
    @objc func sendVenmoPayment() {
        
    }
    
    func getAccessToken(completionHandler: @escaping (String) -> Void){
        //Request to receive access token - To be another class
        let baseUrl = "https://api.venmo.com/v1/"
        let url = URL(string: baseUrl + "oauth/access_token")!
        var request = URLRequest(url: url)

        //get device id, add headers to post request
        let deviceID = UIDevice.current.identifierForVendor!.uuidString

        request.addValue(deviceID, forHTTPHeaderField: "device-id")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        //add data to body
        let body = ["phone_email_or_username": user1.username,
                      "client_id": "1",
                      "password": user1.password]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        // Create the HTTP request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            if let error = error {
                print ("Error of type: \(error)")
                return

            }
            //handle response using a guard
            guard let httpResponse = response as? HTTPURLResponse,
                       (200...299).contains(httpResponse.statusCode) else {
               print("Error with the response, unexpected status code: \(response)")
               return
             }
            if let data = data,
               let json = try? JSONDecoder().decode(accessToken.self, from: data){
                let jsonAll = try? JSONSerialization.jsonObject(with: data)
                print (jsonAll)
                completionHandler(json.access_token)
            }
        }
        task.resume()
    }
}
