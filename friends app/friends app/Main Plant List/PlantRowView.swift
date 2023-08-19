//
//  PlantRowView.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

struct PlantRowView: View {
    
    @Binding var plant: Plant
    
    var body: some View {
        NavigationLink {
            // The View to open when tapped
            PlantDetailView(plant: $plant)
            
        }label:{
            // Howthe link appears visually
            
            HStack {
                Image(systemName: plant.isCompleted ? "checkmark.circle.fill" : "circle" )
                    .onTapGesture {
                        plant.isCompleted.toggle()
                        
                    }
                VStack(alignment: .leading, spacing: 5) {
                    Text(plant.title)
                        .strikethrough(plant.isCompleted)
                    if !plant.subtitle.isEmpty{
                        Text(plant.subtitle)
                            .font(.caption)
                            .foregroundColor(.gray)
                            .strikethrough(plant.isCompleted)
                        
                        
                    }
                   
                    
                }
                
            }
        }
    }
}

struct PlantRowView_Previews: PreviewProvider {
    static var previews: some View {
        PlantRowView(plant: .constant(Plant(title: "Demo plant")))
    }
}
