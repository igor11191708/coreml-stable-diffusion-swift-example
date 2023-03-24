//
//  Event.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 23.03.2023.
//

import SwiftUI

/// Event description
@available(macOS 13.1, *)
struct LogEvent: Identifiable, Hashable{
    
    /// Identifier
    let id = UUID()
    
    /// Text for an event
    let text : String
        
    /// Event type take a look at ``LogEvenType``
    let type: LogEvenType
    
}
