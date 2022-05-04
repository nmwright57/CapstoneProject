//
//  ChatMessage.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import Foundation
import RealmSwift

class ChatMessage: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id = UUID().uuidString
    @Persisted var partition = "" // "conversation=<conversation-id>"
    @Persisted var author: String? // username
    @Persisted var text = ""
    @Persisted var image: Photo?
    @Persisted var timestamp = Date()

    override static func primaryKey() -> String? {
        return "_id"
    }
    
    convenience init(author: String, text: String, image: Photo?) {
        self.init()
        self.author = author
        self.text = text
        self.image = image ?? nil
        
    }
    
    var conversationId: String {
        get { partition.components(separatedBy: "=")[1] }
        set(conversationId) { partition = "conversation=\(conversationId)"}
    }
}

extension ChatMessage: Identifiable {
    var id: String { _id }
}
