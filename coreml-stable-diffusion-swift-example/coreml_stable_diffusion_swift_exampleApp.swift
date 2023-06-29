//
//  coreml_stable_diffusion_swift_exampleApp.swift
//  coreml-stable-diffusion-swift-example
//
//  Created by Igor on 24.03.2023.
//

import SwiftUI
import coreml_stable_diffusion_swift

@main
struct coreml_stable_diffusion_swift_exampleApp: App {
    
    /// Main view model managing process of generating images
    @StateObject var model = ViewModel(manager: GenerativeManager())
    
    /// The type of view representing the body of this view.
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear{
                    initFolders()
                }
                .environmentObject(model)
                .task {
                    await model.loadModels()
                }
        }
    }
    
    private func initFolders(){
        // TODO: Add try/catch Inform user that there's difficulty while initializing the folder for models
        try? initFolder(name: "models")
    }
}
