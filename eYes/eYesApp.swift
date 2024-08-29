//
//  eYesApp.swift
//  eYes
//
//  Created by Antoine Moreau on 8/29/24.
//

import SwiftUI

@main
struct eYesApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
    }
}
