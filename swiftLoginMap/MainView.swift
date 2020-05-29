//
//  MainView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var manager: HttpAuth
    
    var body: some View {
        TabView {
            
            ContentView().tabItem ({
                Image(systemName: "mappin.circle")
                Text(Constants.TabBarText.mapTabItemTitle)
            }).tag(0)
            
            AccountView(manager: manager).tabItem ({
                Image(systemName: "person.circle")
                Text(Constants.TabBarText.accountTabItemTitle)
            }).tag(1)
        }
    }
}
