//
//  User.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import Foundation
import RealmSwift

class User: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id = UUID().uuidString
    @Persisted var partition = "" // "user=_id"
    @Persisted var userName = ""
    @Persisted var userPreferences: UserPreferences?
    @Persisted var lastSeenAt: Date?
    @Persisted var conversations = List<Conversation>()

    var isProfileSet: Bool { !(userPreferences?.isEmpty ?? true) }
   
    
    convenience init(userName: String, id: String) {
        self.init()
        self.userName = userName
        _id = id
        partition = "user=\(id)"
        userPreferences = UserPreferences()
        userPreferences?.displayName = userName
    }
}
//
//enum Presence: String {
//    case onLine = "On-Line"
//    case offLine = "Off-Line"
//    case hidden = "Hidden"
//    
//    var asString: String {
//        self.rawValue
//    }
//}
