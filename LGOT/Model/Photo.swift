//
//  Photo.swift
//  LGOT
//
//  Created by Natalie Wright on 3/28/22.
//

import RealmSwift
import SwiftUI

class Photo: EmbeddedObject, ObjectKeyIdentifiable {
    @Persisted var _id = UUID().uuidString
    @Persisted var thumbNail: Data?
    @Persisted var picture: Data?
    @Persisted var date = Date()
}
