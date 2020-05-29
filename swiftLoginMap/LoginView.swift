//
//  LoginView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    var body: some View {
        VStack(spacing: 10) {
            Image("LoginLogo")
            .resizable()
                .frame(width: 100, height: 100)
            TextField("Nom d'utilisateur", text: $username)
            Divider().padding()
            TextField("Mot de passe", text: $password)
            
            Button(action: {
                print("\(self.username) and \(self.password)")
            }) {
                Text("Se connecter")
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
