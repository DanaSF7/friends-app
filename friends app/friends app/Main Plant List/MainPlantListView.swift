//
//  MainPlantListView.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

struct MainPlantListView: View {
    
    @ObservedObject var plantManager: PlantManager
    @State private var showSheet = false
    @State private var showConfirmAlert = false
    
    @State var searchText = ""
    
    
    var body: some View {
        
        NavigationStack {
            List($plantManager.plants, editActions: [.all]) { $plant in //binding; free to change
                PlantRowView(plant: $plant)
                
                ForEach (Plant, id: \.self) { plant in
                    HStack {
                        Text(plant.capitalized)
                        Spacer()
                        Image(systemName: "xmark.bin")
                            .foregroundColor(Color.purple)
                    }
                    .padding()
                }
                .navigationTitle("My Garden")
                .searchable(text:  $searchText)
                .toolbar{
                    ToolbarItem(placement: .navigationBarLeading) {
                        
                        EditButton()
                    }
                    
                    ToolbarItemGroup(placement: .navigationBarTrailing){
                        
#if DEBUG
                        Button{
                            showConfirmAlert = true
                        }label: {
                            Image(systemName: "checklist")
                        }
#endif//ignored if not in debug release scheme
                        
                        Button{
                            showSheet = true
                        }label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                
                .sheet(isPresented: $showSheet) {
                    NewPlantView(sourceArray: $plantManager.plants)
                        .presentationDetents([.medium])
                }
                .alert("Load sample data? Warning: All existing data will be deleted", isPresented: $showConfirmAlert){
                    Button("Replace", role: .destructive){
                        plantManager.loadSampleData()
                    }
                }
            }
        }
    }
}


struct MainPlantListView_Previews: PreviewProvider {
    static var previews: some View {
        MainPlantListView(plantManager: PlantManager())
    }
}
