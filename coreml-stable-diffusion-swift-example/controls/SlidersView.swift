//
//  SlidersView.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import SwiftUI

@available(macOS 13.1, *)
struct SlidersView: View {
    
    @EnvironmentObject var model : ViewModel
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            let guidance = String(format: "Guidance scale: %.1f", model.guidanceScale).uppercased()
            Text(guidance)
            Slider(value: $model.guidanceScale, in: 1...20, step: 0.5)
            {
                EmptyView()
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("20")
            }.controlSize(.mini)
            
            let steps = String(format: "Steps: %.0f", model.stepCount).uppercased()
            Text(steps)
            Slider(value: $model.stepCount, in: 1...25, step: 1)
            {
                EmptyView()
            } minimumValueLabel: {
                Text("1")
            } maximumValueLabel: {
                Text("25")
            }.controlSize(.large)
            
            let strength = String(format: "Strength: %.1f", model.strength).uppercased()
            Text(strength)
            Slider(value: $model.strength, in: 0.1...1, step: 0.1)
            {
                EmptyView()
                
            } minimumValueLabel: {
                Text("0.1")
            } maximumValueLabel: {
                Text("1")
            }.controlSize(.mini)
        }
    }
}


