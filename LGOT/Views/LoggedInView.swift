//
//  LoggedInView.swift
//  LGOT
//
//  Created by Natalie Wright on 3/25/22.
//


import SwiftUI
import RealmSwift

struct LoggedInView: View {
    @EnvironmentObject var state: AppState
    
//    @ObservedResults(User.self, subscriptions: []) var sumfin
    @ObservedResults(User.self) var users
    @Binding var userID: String?
    
    @State private var showingProfileView = false
    @State private var showingConversationView = false
    @State private var showingQuestionnaireView = false
    @State private var showingAddFriendView = false
    
    var body: some View {
        ZStack {
            if let user = users.first {
                if showingConversationView {
                    ConversationListView(user: user)
                } else {
                    SetUserProfileView(user: user, isPresented: $showingProfileView, userID: $userID)
                        .navigationBarItems(leading: Button(action: {}, label: {
                            NavigationLink(destination: ConversationListView(user: user)){
                                Text("Chats")
                            }
                        }))
                }
            }
            Spacer()
            
            HStack{
                Button(action: {
                    showingQuestionnaireView.toggle()}) {
                        Text("Let's Go Out")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)
                Button(action: {
                    showingAddFriendView.toggle()}) {
                        Text("Add Friend")
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)
                    .padding(.horizontal, 24)
                
            }
            .padding(.top, 650)
        }
        .navigationBarTitle("Profile", displayMode: .inline)
        .sheet(isPresented: $showingQuestionnaireView){
            QuestionnaireView()
        }
        
        
    }
}

struct LoggedInView_Previews: PreviewProvider {
    static var previews: some View {
        LoggedInView(userID: .constant("Natalie"))
            .environmentObject(AppState.sample)
.previewInterfaceOrientation(.portrait)
    }
}
