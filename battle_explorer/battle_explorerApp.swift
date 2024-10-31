//
//  battle_explorerApp.swift
//  battle_explorer
//
//  Created by Tony Chen on 10/30/24.
//

import SwiftUI

@main
struct battle_explorerApp: App {
    @State private var allBattles = AllBattles() // Use @State for @Observable objects

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(allBattles) // Provide it as an environment
        }
    }
}
