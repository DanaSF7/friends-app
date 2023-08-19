//
//  NewTodoView.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

struct NewPlantView: View {
        
        @State private var isToggled = false
       @State private var isToggledd = false
        @State private var title = ""
        @State private var subtitle = ""
        @Binding var sourceArray: [Plant]
        @Environment(\.dismiss) var dismiss
        
        
        var body: some View {
            Form {
                Section{
                    TextField("Title", text:$title)
                    TextField("subtitle", text:$subtitle)
                    Toggle("Add to favouritres?", isOn: $isToggled)
                    Toggle("Poisonous?", isOn: $isToggledd)
                }
                Section{
                    Button("Save"){
                        let plant = Plant(title: title, subtitle: subtitle)
                        sourceArray.append(plant)
                        dismiss()
                        
                    }
                    Button("Cancel", role: .destructive){
                        dismiss()
                    }
                }
            }
        }
    }

struct NewPlantView_Previews: PreviewProvider {
    static var previews: some View {
        NewPlantView(sourceArray: .constant([]))
    }
}
