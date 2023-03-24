//
//  Prompts.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import SwiftUI

@available(macOS 13.1, *)
/// Prompts controls
struct Prompts: View {
    
    @EnvironmentObject var model : ViewModel
    
    /// The placement of focus within the scene changes.
    @FocusState private var focused: Bool
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        VStack(alignment: .leading){
            Text("Prompt".uppercased())
                TextEditor(text: $model.prompt)
                    .font(.body)
                    .focused($focused)
                    .frame(height: 68)
                    .border(Color(nsColor: .gridColor))
                    .cornerRadius(4)
            
            Text("Negative prompt".uppercased())
                TextEditor(text: $model.negativePrompt)
                    .font(.body)
                    .frame(height: 68)
                    .border(Color(nsColor: .gridColor))
                    .cornerRadius(4)
            
        }
    }
}

