//
//  PlantDetailView.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

struct PlantDetailView: View {

    @Binding var plant: Plant//if private and state no one can change or access
        
        var body: some View {
            Form{
                TextField("Title", text: $plant.title)
                TextField("subtitle", text: $plant.subtitle)
                Toggle("Is fully grown?", isOn: $plant.isCompleted)
                

            }
            .navigationTitle("Plant Detail")
        }
    }


struct PlantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{ //make the nav tab appear
            PlantDetailView(plant: .constant(Plant(title: "Sunflower")))
        }
    }
}
