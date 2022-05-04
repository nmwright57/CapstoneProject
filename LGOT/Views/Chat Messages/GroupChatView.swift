//
//  GroupChatView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//


import RealmSwift
import SwiftUI

struct GroupChatView: View {
    @EnvironmentObject var state: AppState
    
    @ObservedRealmObject var user: User
    var conversation: Conversation?
    var isPreview = false
    
    let padding: CGFloat = 8
    
    var body: some View {
        VStack {
            if let conversation = conversation {
                if isPreview {
                    GroupChatBubblesView(user: user, conversation: conversation, isPreview: isPreview)
                } else {
                    GroupChatBubblesView(user: user, conversation: conversation)
                        .environment(\.realmConfiguration, app.currentUser!.configuration(partitionValue: "conversation=\(conversation.id)"))
                }
            }
            Spacer()
        }
        .navigationBarTitle(conversation?.displayName ?? "Chat", displayMode: .inline)
        .padding(.horizontal, padding)
        .onAppear(perform: clearUnreadCount)
        .onDisappear(perform: clearUnreadCount)
    }
    
    private func clearUnreadCount() {
        if let conversationId = conversation?.id {
            if let conversationIndex = user.conversations.firstIndex(where: { $0.id == conversationId }) {
                $user.conversations[conversationIndex].unreadCount.wrappedValue = 0
            }
        }
    }
}

struct ChatRoom_Previews: PreviewProvider {
    static var previews: some View {
        Realm.bootstrap()
        
        return AppearancePreviews(
            Group {
                NavigationView {
                    GroupChatView(user: .sample, conversation: .sample, isPreview: true)
                }
            }
        )
        .environmentObject(AppState.sample)
    }
}
