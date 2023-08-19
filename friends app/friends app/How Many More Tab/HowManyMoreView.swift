//
//  HowManyMoreView.swift
//  friends app
//
//  Created by Dana Al Fanek on 15/08/2023.
//

import SwiftUI

struct HowManyMoreView: View {
        
        @ObservedObject var plantManager: PlantManager
        
        var body: some View {
            VStack{
                Text("You have completed ^[\(plantManager.numPlantsDone) plants](inflect: true)!")
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                Text("You have ^[\(plantManager.numPlantsNotDone) plants](inflect: true) left.")
                    .padding()
            }
            
        }
    }

struct HowManyMoreView_Previews: PreviewProvider {
    static var previews: some View {
        HowManyMoreView(plantManager: PlantManager())
    }
}
