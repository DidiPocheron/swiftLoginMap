//
//  ContentView.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import MapKit
import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var searchTerm: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // Display MapView
            MapView(centerCoordinate: $centerCoordinate)
                .edgesIgnoringSafeArea(.all)
            
            // Display Search TextField
            TextField("Search", text: $searchTerm, onEditingChanged: {_ in }) {
                
            }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
                .offset(y: 44)
            
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            // If NavigationView is set the other elements are not display
            // But if don't set NavigationView, Navigation are disable...
            // Need to check!
            /////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
//            NavigationView {
                // Display List View
                AppartmentListView (searchTerm: searchTerm) {
                    
                }.animation(.spring())
                    .offset(y: 100)
//            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
