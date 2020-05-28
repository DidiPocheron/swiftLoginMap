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
    @State private var centerCoordinate = CLLocationCoordinate2D()
    @State private var locations = [MKPointAnnotation]()
    @State private var searchTerm: String = ""
    
    let names = ["Azam", "Jake", "Alex", "Mary"]
    
    var appartment:AppartmentModel
    
    var body: some View {
        ZStack {
            MapView(centerCoordinate: $centerCoordinate, annotations: locations)
                .edgesIgnoringSafeArea(.all)
            
//            List {
//                SearchBar(text: $searchTerm)
//                
//                ForEach(self.names.filter {
//                    self.searchTerm.isEmpty ? true :
//                        $0.localizedCaseInsensitiveContains(self.searchTerm)
//                }, id: \.self) { name in
//                    Text(name)
//                }
//            }
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button(action: {
                        let newLocation = MKPointAnnotation()
                        newLocation.coordinate = self.centerCoordinate
                        self.locations.append(newLocation)
                    }) {
                        Image(systemName: "plus")
                    }
                .padding()
                .background(Color.black.opacity(0.75))
                .foregroundColor(.white)
                .font(.title)
                .clipShape(Circle())
                .padding(.trailing)
                }
            }
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(appartment: appartmentData[0])
    }
}
