//
//  ToolBarContent.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 24.03.2023.
//

import SwiftUI
import coreml_stable_diffusion_swift

struct ToolBarContent: View {
    
    @EnvironmentObject var model : ViewModel
    
    @Environment(\.openURL) var openURL
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        toolbarTpl
    }
    
    @ViewBuilder
    /// Set of controls for toolbar
    private var toolbarTpl : some View{
            Button{
                showInFinder()
            } label: {
                HStack{
                    Image(systemName: "circle.hexagonpath.fill")
                        .font(.system(size: 14))
                        .foregroundColor(.brown)
                    Text("Local models")
                }
            }
    
            HStack {
                Divider()
            }

            Button{
                if let url = URL(string: "https://huggingface.co/apple"){
                    openURL(url)
                }else{
                    model.addToEventLog("URL error to huggingface.co/apple", type: .error)
                }
            } label: {
                HStack{
                    Image(systemName: "apple.logo")
                        .font(.system(size: 14))
                        .foregroundColor(.brown)
                    Text("Apple models")
                }
            }
    }
}

