//
//  CaptionLabel.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import SwiftUI

struct CaptionLabel: View {
    let title: String
    
    private let lineLimit = 5

    var body: some View {
        HStack {
            Text(LocalizedStringKey(title))
                .font(.caption)
                .lineLimit(lineLimit)
                .multilineTextAlignment(.leading)
                .foregroundColor(.secondary)
            Spacer()
        }
    }
}

struct CaptionLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            CaptionLabel(title: "Title")
                .previewLayout(.sizeThatFits)
                .padding()
        )
    }
}