//
//  LoginTextFieldView.swift
//  swiftLoginMap
//
//  Created by Didi on 29/05/2020.
//  Copyright © 2020 Dimitri. All rights reserved.
//

import SwiftUI

struct LoginTextFieldView: View {
    var placeholder: Text
    @Binding var text: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}
