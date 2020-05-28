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
    @State private var locations = [MKPointAnnotation]()
    @State private var searchTerm: String = ""
    
    var body: some View {
        ZStack(alignment: .top) {
            
            // Display MapView
            MapView(centerCoordinate: $centerCoordinate, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            
            // Display Search TextField
            TextField("Search", text: $searchTerm, onEditingChanged: {_ in }) {
                //commit

            }.textFieldStyle(RoundedBorderTextFieldStyle())
            .padding()
            .offset(y: 44)
            
            // Display List View
            AppartmentListView (searchTerm: searchTerm) {
                
            }.animation(.spring())
                .offset(y: 100)
            
//            List {
//                ForEach(appartmentData) { appartment in
//                    if(self.searchTerm.isEmpty) {
//                        Text(appartment.name)
//                    }else if(appartment.name.localizedCaseInsensitiveContains(self.searchTerm)){
//                        Text(appartment.name)
//                    }
//                }
//            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
