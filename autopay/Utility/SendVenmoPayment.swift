//
//  SendVenmoPayment.swift
//  autopay
//
//  Created by Waleed E on 5/20/21.
//

import Foundation
import UIKit

class SendVenmoPayment {
    
    //Struct to hold the Access Token data from API call
    struct accessToken: Codable {
        let access_token: String
        let id: String
    }
    
    struct payment: Codable {
        let balance: String
        let date_created: String
    }
    
    //declare blank timer variable
    var timer = Timer()
    
    func startTimer() {
        //in a function or viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(sendVenmoPayment), userInfo: nil, repeats: false)
    }
    
    //Function to send a payment using the access token received
    @objc func sendVenmoPayment() {
        
        //get the access token for a user
        getAccessToken() { (data) in
            print("Access Token info is " + data.access_token + "id is " + data.id)
            self.makeVenmoPaymentRequest(completionHandler: { (payment) in
                print("Payment info is" + payment.balance + "date created is " + payment.date_created)
            }, accessToken: data)
        }
    }
    
    func makeVenmoPaymentRequest(completionHandler: @escaping (payment) -> Void, accessToken: accessToken){
        
        let baseUrl = "https://api.venmo.com/v1/"
        let url = URL(string: baseUrl + "payments")!
        var request = URLRequest(url: url)

        request.addValue(accessToken.access_token, forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        //add data to body
        let body = ["funding_source_id": 123,
                    "metadata": ["quasi_cash_disclaimer_viewed": false],
                    "user_id": accessToken.id,
                    "audience": "private",
                    "amount": 2,
                    "note": "tacos blacos"] as [String : Any]
        let bodyData = try? JSONSerialization.data(
            withJSONObject: body,
            options: []
        )

        // Change the URLRequest to a POST request
        request.httpMethod = "POST"
        request.httpBody = bodyData
        
        // Create the HTTP request
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in

            //handle error
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
            //Handle successful data response
            if let data = data,
               let json = try? JSONDecoder().decode(payment.self, from: data){
                completionHandler(json)
            }
        }
        task.resume()
    }
    
    //Function made for receiving the access token using a Venmo user's username and password.
    // Uses completion handler to return result to calling function
    func getAccessToken(completionHandler: @escaping (accessToken) -> Void){
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

            //handle error
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
            //Handle successful data response
            if let data = data,
               let json = try? JSONDecoder().decode(accessToken.self, from: data){
                completionHandler(json)
            }
        }
        task.resume()
    }
}
