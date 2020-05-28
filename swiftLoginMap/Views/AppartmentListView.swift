//
//  AppartmentListView.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct AppartmentListView: View {
    let searchTerm: String
    var onTap: () -> ()
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                EmptyView()
            }.frame(width: UIScreen.main.bounds.size.width, height: 60)
                .background(Color.gray)
                .gesture(TapGesture()
                    .onEnded(self.onTap)
            )
            
            List {
                ForEach(appartmentData) { appartment in
                    if(self.searchTerm.isEmpty) {
                        Text(appartment.name)
                    }else if(appartment.name.localizedCaseInsensitiveContains(self.searchTerm)){
                        Text(appartment.name)
                    }
                }
            }.animation(nil)
            
        }.cornerRadius(10)
    }
}

struct AppartmentListView_Previews: PreviewProvider {
    static var previews: some View {
        AppartmentListView(searchTerm: "", onTap: {})
    }
}
