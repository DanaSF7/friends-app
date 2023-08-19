//
//  PlantManager.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import Foundation
import SwiftUI

class PlantManager: ObservableObject {
    @Published var plants: [Plant] = [] {
        didSet {
            save()
        }
    }
    
    var numPlantsDone: Int {
        plants.filter{ $0.isCompleted}.count
    }
    var numPlantsNotDone: Int {
        plants.filter{ !$0.isCompleted}.count
    }
    
        
    init() {
        load()
    }
    
    func loadSampleData(){
        plants = Plant.sampleplants
    }
    
    func getArchiveURL() -> URL {
        let plistName = "plants.plist"
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        return documentsDirectory.appendingPathComponent(plistName)
    }
    
    func save() {
        let archiveURL = getArchiveURL()
        print(archiveURL)
        let propertyListEncoder = PropertyListEncoder()
        let encodedTodos = try? propertyListEncoder.encode(plants)
        try? encodedTodos?.write(to: archiveURL, options: .noFileProtection)
    }
    
    func load() {
        let archiveURL = getArchiveURL()
        let propertyListDecoder = PropertyListDecoder()
                
        if let retrievedTodoData = try? Data(contentsOf: archiveURL),
            let plantsDecoded = try? propertyListDecoder.decode([Plant].self, from: retrievedTodoData) {
            plants = plantsDecoded
        }
    }
}
