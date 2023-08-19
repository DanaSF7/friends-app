//
//  File.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import Foundation

struct Plant: Identifiable, Codable {
    
    var id = UUID() // 500716d5-ea3f-4696-8954-e35204a67c39 - 2.71 X 10^18
    var title: String
    var subtitle = ""
    var isCompleted = false
    var isToggled = false
    var isToggledd = false

}
