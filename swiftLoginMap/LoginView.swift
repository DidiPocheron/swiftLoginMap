//
//  LoginView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI
import Combine

class HttpAuth: ObservableObject {
    var didChange = PassthroughSubject<HttpAuth, Never>()
    
    var authentificated = false {
        didSet {
            didChange.send(self)
        }
    }
    
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
            
            print(data)
        }.resume()
    }
}

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var manager = HttpAuth()
    
    var body: some View {
        VStack(spacing: 10) {
            Image("LoginLogo")
            .resizable()
                .frame(width: 100, height: 100)
            LoginTextFieldView(
                placeholder: Text("Nom d'utilisateur").foregroundColor(.red),
                text: $username
            )
            Divider()
                .padding()
            LoginTextFieldView(
                placeholder: Text("Mot de passe").foregroundColor(.red),
                text: $password
            )
            
            Button(action: {
                print("\(self.username) and \(self.password)")
                self.manager.checkDetails(username: self.username, password: self.password)
            }) {
                Text("Se connecter")
                    .foregroundColor(.black)
            }
        }.background(Image("LoginBackground")
            .scaledToFill()
            .clipped()
            .edgesIgnoringSafeArea([.top]))
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
