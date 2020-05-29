//
//  RootView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct RootView: View {
    
    @ObservedObject var manager = HttpAuth()
    
    var body: some View {
        VStack {
            if(manager.authentificated) {
                MainView(manager: manager)
            }else {
                LoginView(manager: manager)
            }
        }
    }
}
