//
//  appartmentModel.swift
//  swiftLoginMap
//
//  Created by Didi on 28/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct AppartmentModel: Identifiable, Decodable {
    let id:Int
    let name:String
    let description:String
    let latitude:Float
    let longitude:Float
}
