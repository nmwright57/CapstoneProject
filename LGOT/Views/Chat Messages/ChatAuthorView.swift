//
//  ChatAuthorView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import SwiftUI
import RealmSwift

struct ChatAuthorView: View {
    @ObservedResults(Chatster.self) var chatsters
    
    let userName: String
    
    var chatster: Chatster? {
        chatsters.filter("userName = %@", userName).first
    }
    
    private enum Dimensions {
        static let authorHeight: CGFloat = 25
        static let padding: CGFloat = 4
    }
    
    var body: some View {
        if let author = chatster {
            HStack {
                if let photo = author.avatarImage {
                    AvatarThumbNailView(photo: photo, imageSize: Dimensions.authorHeight)
                }
                if let name = author.displayName {
                    Text(name)
                    .font(.caption)
                } else {
                    Text(author.userName)
                        .font(.caption)
                }
                Spacer()
            }
            .frame(maxHeight: Dimensions.authorHeight)
            .padding(Dimensions.padding)
        }
    }
}

struct ChatAuthorView_Previews: PreviewProvider {
    static var previews: some View {
        Realm.bootstrap()
        
        return AppearancePreviews(ChatAuthorView(userName: "nat@gmail.com"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
