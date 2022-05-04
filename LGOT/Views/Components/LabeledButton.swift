//
//  LabeledButton.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import SwiftUI

struct LabeledButton: View {
    let label: String
    let text: String
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            LabeledText(label: label, text: text)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct LabelledButton_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            LabeledButton(label: "My label", text: "My Text") {}
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
