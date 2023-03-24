//
//  ContentView.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import SwiftUI


@available(macOS 13.1, *)
struct ContentView: View {
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        NavigationSplitView{
                SideBar()
        }
        detail: {
            HStack{
                OutputView().frame(minWidth: 800)
                LoggerTpl().frame(maxWidth: 302)
            }
        }
        .navigationSplitViewStyle(.balanced)
        .toolbar{
            ToolbarItemGroup{
                ToolBarContent()
            }
        }
        .background(
            Image("bg")
                .resizable()
                .aspectRatio(contentMode: .fill)
        )
    }
}


