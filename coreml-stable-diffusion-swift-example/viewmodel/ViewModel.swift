//
//  ViewModel.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import Foundation
import coreml_stable_diffusion_swift
import SwiftUI
import StableDiffusion

@available(macOS 13.1, *)
@MainActor
/// View model for managing image generation
final class ViewModel: ObservableObject, IEventLoger{
    
    // MARK: - Input
    
    ///Text prompt to guide sampling
    @Published var prompt : String = "an astronaut riding a horse on mars artstation, hd, dramatic lighting, detailed"
    /// Negative text prompt to guide sampling
    @Published var negativePrompt : String = ""
    /// Selected model
    @Published var selected : String = "empty"
    /// Starting image for image2image or in-painting
    @Published var inputImage: CGImage? = nil
    /// Strength
    @Published var strength: Float = 0.5
    /// Controls the influence of the text prompt on sampling process (0=random images)
    @Published var guidanceScale: Float = 7.5
    /// Number of inference steps to perform
    @Published var stepCount: Float = 11
    
    @Published var seed: UInt32 = 50
    /// Safety checks
    @Published var disableSafety: Bool = false
    /// Reduce memory if you use it on devises with limited memory amount
    @Published var reduceMemory: Bool = false
    
    @Published var scheduler: GenerativeManager.Scheduler = GenerativeManager.defaultScheduler
    
    // MARK: - Output
        
    /// Result image
    @Published var outputImage: Image? = nil
    
    // MARK: - Service properties
    
    /// Current progress
    @Published private(set) var progress : ProgressState = .idle
       
        
    /// List of available models
    @Published private(set) var models : [GenerativeModel] = []
        { didSet{ loadingModels = models.isEmpty } }
        
    /// Indicate of the  models loading process
    @Published private(set) var loadingModels : Bool = false
    
    /// List of events
    @Published var logEvents: [LogEvent] = []
    
    // MARK: - Private
    
    /// Pipeline for generating images
    private var pipeline: StableDiffusionPipeline? = nil
        
    /// Image generating manager
    private var manager: IGenerativeManager
    
    // MARK: - Life circle
    
    public init(manager : IGenerativeManager){
        self.manager = manager
    }
    
    // MARK: - API
    
        /// Load models
    public func loadModels() async{
        resetModels()
        let list = await manager.loadModels()
        setModels(list)
        selectFirstModel(from: list)
        addToEventLog("Loaded \(list.count) models", type: .message)
    }
    
    /// Generate an image
    public func generate() async{
         
        beforeGenerate()
        
        let config = manager.getConfig(prompt, negativePrompt, inputImage, seed, strength, guidanceScale, stepCount, disableSafety, scheduler.type)
        
        do{
            guard let pipeline else{ throw Errors.pipelineIsNotDefined }
            
            let images: [CGImage?] = try await manager.generate(
                with: config, by: pipeline
            )
            
            afterGenerate(images)
        }catch{
            logError(error)
            setProgress(.failed)
        }
    }
    
        /// Set of actions on model has been changed
    /// - Parameter value: Name of the model
    public func updateModel(_ value : String) {
        
        guard let model = models.filter({ $0.name == value }).first, let url = model.url else{
            return
        }
        
        guard let pipeline = try? getDiffusionPipeline(
            for: url, disableSafety, reduceMemory
        )else{
            return
        }
        
        self.pipeline = pipeline
    }
        
    /// Clean output result
    public func cleanOutput() {
        outputImage = nil
    }
    
    /// Set progress state at **.canceling**
    public func setCancellation(){
        setProgress(.canceling)
    }
    
   
    // MARK: - Private
    
    /// Set the current state of image generation
    /// - Parameter value: State
    private func setProgress(_ value : ProgressState){
        progress = value
    }
    
    /// Set of actions before starting the generation result
    private func beforeGenerate(){
        setProgress(.running)
        resetOutputImage()
        addToEventLog("Started processing", type: .message)
    }
        
    /// Set of actions after getting the generation result
    /// - Parameter images: Result of generation
    private func afterGenerate(_ images: [CGImage?]){
        let output = getImage(cgImage: images.compactMap { $0 }.first)
        setOutputImage(output)
        setProgress(.finished)
        logOutput(output)
    }
        
    /// Select first model
    /// - Parameter list: First model from the list
    private func selectFirstModel(from list : [GenerativeModel]){
        if let model = list.first{
            selected = model.name
        }
    }
    
    /// Reset the result image
    private func resetOutputImage(){
        outputImage = nil
    }
        
    /// Set output result
    /// - Parameter value: Result of generating an image
    private func setOutputImage(_ value : Image?){
        outputImage = value
    }
        
        
    /// Set models picker to empty
    private func resetModels(){
        selected = "empty"
        models = []
    }
        
    /// Set models
    /// - Parameter value: Models
    private func setModels(_ value : [GenerativeModel]){
        models += value
    }

}
