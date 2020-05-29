//
//  AccountView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct AccountView: View {
    
    @ObservedObject var manager = HttpAuth()
    
    var body: some View {
        VStack(spacing: 10) {
            Image("LoginLogo")
                .resizable()
                .frame(width: 100, height: 100)
            
            Button(action: {
                DispatchQueue.main.async {
                    self.manager.authentificated = false
                }
            }) {
                Text(Constants.AccountText.disconnectButtonTitle)
                    .foregroundColor(.black)
            }
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView()
    }
}
