//
//  friends_appApp.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

@main
struct friends_appApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(plant: .constant(Plant(title: "Sunflower")))
        }
    }
}
