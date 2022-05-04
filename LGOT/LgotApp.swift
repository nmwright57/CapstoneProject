//
//  AppState.swift
//  LGOT
//
//  Created by Natalie Wright on 3/26/22.
//

import SwiftUI
import RealmSwift

let app = RealmSwift.App(id: "lgot-ogyrp") 
@main
struct LgotApp: SwiftUI.App {
    @StateObject var state = AppState()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(state)
        }
    }
}
