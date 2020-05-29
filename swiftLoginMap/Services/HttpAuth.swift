//
//  HttpAuth.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import Foundation
import Combine

class HttpAuth: ObservableObject {
    
     @Published var authentificated: Bool = false
    
    func checkDetails(username: String, password: String) {
        guard let url = URL(string: "http://localhost:3000/login") else {
            return
        }
        
        let body: [String: String] = ["username": username, "password": password]
        
        let finalBody = try! JSONSerialization.data(withJSONObject: body)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = finalBody
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) {
            (data, response, error) in
            
            guard let data = data else { return }
            
            let finalData = try! JSONDecoder().decode(ServerMessage.self, from: data)
            
            //////////////////////////////////////////////////////////////////////////////////////////
            // Check need to be change to status code!
            //////////////////////////////////////////////////////////////////////////////////////////
            
            if finalData.status == "ok" {
                DispatchQueue.main.async {
                    self.authentificated = true
                }
            }else{
                print("error")
            }
        }.resume()
    }
}
