//
//  SendButton.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//


import SwiftUI

struct SendButton: View {
    let action: () -> Void
    var active = true
    
    var body: some View {
        ButtonTemplate(action: action, active: active, activeImage: "paperplane.fill", inactiveImage: "paperplane")
    }
}

struct SendButton_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            Group {
                SendButton(action: {}, active: false)
                SendButton(action: {})
            }
        )
        .previewLayout(.sizeThatFits)
        .padding()
    }
}
