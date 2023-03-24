//
//  InputImageView.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import SwiftUI
import PhotosUI
import coreml_stable_diffusion_swift

@available(macOS 13.1, *)
struct InputImageView: View {
    
    @EnvironmentObject var model : ViewModel
    
    @State private var selectedItem: PhotosPickerItem?
    
    @State private var image : Image? = nil
    
    @State private var task : Task<(), Never>?
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        VStack(alignment: .center, spacing: 25){
            Rectangle().stroke(Color.gray, lineWidth: 0.5)
                    .overlay(imageTpl)
                    .overlay(cleanTpl, alignment: .bottomTrailing)
                    .frame(height: 128)
            PhotosPicker(
                selection: $selectedItem,
                matching: .images
            ) {
                Text("Select a Photo")
            }
            .onChange(of: selectedItem) { _ in
                task = onChange()
            }
        }
        .onDisappear{
            cancelTask()
        }
    }
    
    // MARK: - Private
    
    @ViewBuilder
    private var cleanTpl : some View{
        Button{
            model.inputImage = nil
            image = nil
        }label: {
            Image(systemName: "x.circle")
                .font(.system(size: 14))
        }.padding(.trailing, 5)
            .padding(.bottom, 5)
            .disabled(image == nil)
    }
    
    @ViewBuilder
    private var imageTpl : some View{
        if let image{
            image
                .resizable()
                .scaledToFit()
                .frame(height: 128)
        }else{
            emptyImageTpl(height: 64)
        }
    }
    
    private func cancelTask(){
        task?.cancel()
    }
    
    @MainActor
    private func update( image : NSImage?){
        if let nsImage = image{
            model.outputImage = nil
            model.inputImage = nsImage.CGImage
            self.image = Image(nsImage: nsImage)
        }else{
            model.addToEventLog("Could not prepare image", type: .error)
        }
    }
    
    private func onChange() -> Task<(), Never>{
       Task {
            if let data = try? await selectedItem?.loadTransferable(type: Data.self) {
                let toSize : NSSize = .init(width: 256, height: 256)
                let nsImage = await getNSImage(from : data, cropped: toSize)
                
                await MainActor.run{
                    update(image: nsImage)
                }
            }
        }
    }
}
