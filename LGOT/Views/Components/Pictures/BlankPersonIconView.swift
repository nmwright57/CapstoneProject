//
//  BlankPersonIconView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//


import SwiftUI

struct BlankPersonIconView: View {
    var body: some View {
        Image(systemName: "person.crop.circle.fill")
            .resizable()
            .foregroundColor(.gray)
    }
}

struct PersonIconView_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            BlankPersonIconView()
                .frame(width: 50, height: 50)
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
