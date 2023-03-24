//
//  IEventLog.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 24.03.2023.
//

import Foundation
import StableDiffusion
import SwiftUI

@MainActor
protocol IEventLoger: AnyObject{
    
    /// List of events
    var logEvents: [LogEvent] { get set }
    
}

extension IEventLoger{
    
    /// Add message about result of generation an image
    /// - Parameter result: Result image
    func logOutput(_ result: Image?){
        if result == nil{
            addToEventLog("Result is empty", type: .warning)
        }else{
            addToEventLog("Finished successfully", type: .message)
        }
    }
    
    /// Clean event list
    func cleanEventLog() {
        logEvents = []
    }
    
    /// Add an event message
    /// - Parameters:
    ///   - text: Description of event
    ///   - type: Type of event
    func addToEventLog(_ text : String, type: LogEvenType){
        logEvents.insert(.init(text: text, type: type), at: 0)
    }
    
    /// Process an error
    /// - Parameter value: Error
    func logError(_ value : Error){
        
        if let e = value as? StableDiffusionPipeline.Error, e == .startingImageProvidedWithoutEncoder{
            addToEventLog("The selected model does not support an input image", type: .error)
            addToEventLog("Clean up input image and type in only PROMPT", type: .warning)
        }else if let e = value as? Encoder.Error, e == .sampleInputShapeNotCorrect {
            addToEventLog("The image size doesn't match the required size 512x512", type: .error)
        }else{
            addToEventLog("Unknown error", type: .error)
        }
    }
    
}
