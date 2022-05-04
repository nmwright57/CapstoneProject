//
//  UserPreferences.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import RealmSwift

class UserPreferences: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var displayName: String?
    @Persisted var avatarImage: Photo?

    var isEmpty: Bool { displayName == nil || displayName == "" }
}
