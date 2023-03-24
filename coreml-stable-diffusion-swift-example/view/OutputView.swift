//
//  OutputView.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import SwiftUI
import coreml_stable_diffusion_swift

@available(macOS 13.1, *)
struct OutputView: View {
    
    @EnvironmentObject var model : ViewModel
    
    // MARK: - Private properties
    
    /// Generation is running
    private var isRunning : Bool{
        model.progress == .running
    }
    /// Generation is canceling
    private var isCanceling : Bool{
        model.progress == .canceling
    }
    /// Background opacity
    private var bgOpacity : CGFloat{
        isRunning || isCanceling ? 0.25 : 1
    }
    /// Offset to hide empty tpl
    private var offsetForEmpty : CGFloat {
        model.outputImage == nil ? 0 : -1000
    }
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        ZStack{
            emptyTpl
                .offset(y: offsetForEmpty)
                .animation(.spring(), value: model.outputImage)
                .opacity(bgOpacity)
            if let image = model.outputImage{
                image
            }else if isRunning{
                progressTpl("Generating image")
            }else if isCanceling{
                progressTpl("Canceling generation")
            }
        }
        .frame(minWidth: 640, maxWidth: .infinity, minHeight: 480, maxHeight: .infinity)
        .overlay(cleanTpl, alignment: .bottomTrailing)
        .overlay(shareTpl, alignment: .topTrailing)
    }
    
    // MARK: - Private
    
    
    @ViewBuilder
    private var shareTpl: some View{
        if let image = model.outputImage{
            ShareLink(item: image, preview: SharePreview("Generated image", image: image))
                .padding(.top)
                .padding(.trailing)
        }else{
            EmptyView()
        }
    }
    
    @ViewBuilder
    private func progressTpl(_ text : String) -> some View{
        VStack(spacing: 25){
            ProgressView()
            Text(text)
                .font(.largeTitle)
        }
    }
    
    @ViewBuilder
    private var cleanTpl : some View{
        Button{
            model.cleanOutput()
        }label: {
            Image(systemName: "x.circle")
                .font(.system(size: 14))
        }
        .padding(.trailing, 25)
        .padding(.bottom, 25)
        .disabled(model.outputImage == nil)
    }
    
    @ViewBuilder
    private var emptyTpl: some View{
        VStack{
            Image("app")
                .resizable()
                .scaleEffect(0.75, anchor: .center)
                .scaledToFit()
                .foregroundColor(.yellow)
                .fontWeight(.thin)
            HStack{
                Text("Pick up a model")
                    .font(.system(size: 50, design: .rounded)).fontWeight(.bold)
                    .foregroundColor(.white.opacity(0.75))
                Image(systemName: "arrow.turn.right.down")
                    .font(.system(size: 80)).fontWeight(.regular)
                    .foregroundColor(.pink)
            }
            Text("and select a photo or write a prompt")
                .font(.system(size: 27, design: .rounded)).fontWeight(.regular)
                .padding(.leading, 150)
                .foregroundColor(.gray)
        }
    }
}


