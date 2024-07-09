//
//  GlobalLoginAppApp.swift
//  GlobalLoginApp
//
//  Created by Onur ÇAM on 9.07.2024.
//

import SwiftUI

@main
struct GlobalLoginAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
