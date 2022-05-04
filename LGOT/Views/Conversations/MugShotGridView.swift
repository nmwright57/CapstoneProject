//
//  MugShotGridView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//


import SwiftUI

struct MugShotGridView: View {
    let members: [Chatster]
    
    private let rows = [
        GridItem(.flexible())
    ]
    
    private enum Dimensions {
        static let spacing: CGFloat = 0
        static let height: CGFloat = 50.0
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: true) {
            LazyHGrid(rows: rows, alignment: .center, spacing: Dimensions.spacing) {
                ForEach(members) { member in
                    UserProfilePicView(
                        photo: member.avatarImage
                       )
                }
            }
            .frame(height: Dimensions.height)
        }
    }
}

struct MugShotGridView_Previews: PreviewProvider {
    static var previews: some View {
        AppearancePreviews(
            MugShotGridView(members: [.sample, .sample2, .sample3, .sample, .sample2,
                                      .sample3, .sample, .sample2, .sample3, .sample, .sample2, .sample3])
        )
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
