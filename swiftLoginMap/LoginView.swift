//
//  LoginView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @ObservedObject var manager: HttpAuth
    
    var body: some View {
        VStack(spacing: 10) {
            Image("LoginLogo")
            .resizable()
                .frame(width: 100, height: 100)
            
            LoginTextFieldView(
                placeholder: Text(Constants.LoginText.userNamePlaceHolder).foregroundColor(.red),
                text: $username
            )
            Divider()
                .padding()
            LoginTextFieldView(
                placeholder: Text(Constants.LoginText.passwordPlaceHolder).foregroundColor(.red),
                text: $password
            )
            
            Button(action: {
                print("\(self.username) and \(self.password)")
                self.manager.checkDetails(username: self.username, password: self.password)
            }) {
                Text(Constants.LoginText.connectButtonTitle)
                    .foregroundColor(.black)
            }
        }.background(Image("LoginBackground")
            .scaledToFill()
            .clipped()
            .edgesIgnoringSafeArea([.top]))
    }
}
