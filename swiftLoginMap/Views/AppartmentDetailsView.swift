//
//  AppartmentDetailsView.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct AppartmentDetailsView: View {
    var appartment: AppartmentModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(appartment.name)
            Text(appartment.description)
        }
    }
}

struct AppartmentDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        AppartmentDetailsView(appartment: AppartmentModel(id: 0, name: "Appartment", description: "", latitude: 4.5, longitude: 3.3))
    }
}
