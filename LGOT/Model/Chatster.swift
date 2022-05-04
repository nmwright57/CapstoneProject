//
//  Chatster.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import Foundation
import RealmSwift

class Chatster: Object, ObjectKeyIdentifiable {
    @Persisted(primaryKey: true) var _id = UUID().uuidString // This will match the _id of the associated User
    @Persisted var partition = "all-users=all-the-users"
    @Persisted var userName = ""
    @Persisted var displayName: String?
    @Persisted var avatarImage: Photo?
    @Persisted var lastSeenAt: Date?

}
