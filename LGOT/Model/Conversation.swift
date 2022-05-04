//
//  Conversation.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import Foundation
import RealmSwift

class Conversation: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var id = UUID().uuidString
    @Persisted var displayName = ""
    @Persisted var unreadCount = 0
    @Persisted var members = List<Member>()
}
