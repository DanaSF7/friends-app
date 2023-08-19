//
//  ContentView.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

struct ContentView: View {
    

    @Binding var plant: Plant
    @State var searchText = ""
    
        @StateObject var plantManager = PlantManager()

        var body: some View {
            

            var filteredPlants: [Plant] {
                let lcSearchText =  searchText.lowercased()
                return Plant.sampleplants.filter{
                    plant in plant.title.lowercased().contains(lcSearchText) || (plant.subtitle.lowercased().contains(lcSearchText) )
                }
                }
            
            TabView{
                MainPlantListView(plantManager: plantManager)
                    .tabItem{
                        Label("Plants", systemImage:  "xmark.bin.fill" )
          }
                HowManyMoreView(plantManager: plantManager)
                    .tabItem{
                        Label("Number of plants", systemImage: "checkmark.circle.fill")
                    }
                   
            }
        }
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(plant: .constant(Plant(title: "Sunflower")))
    }
}
