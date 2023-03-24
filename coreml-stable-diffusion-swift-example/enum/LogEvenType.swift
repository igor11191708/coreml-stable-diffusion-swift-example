//
//  LogEvenType.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 23.03.2023.
//

import SwiftUI

/// Type of events
@available(macOS 13.1, *)
enum LogEvenType{
    
    /// For an error
    case error
    /// Warning
    case warning
    /// Any message
    case message
    
    /// Image icon tpl
    @ViewBuilder
    var imageTpl : some View{
        switch self{
        case .error: Image(systemName: "asterisk.circle").font(.body).foregroundColor(.red)
        case .warning: Image(systemName: "exclamationmark.circle").font(.body).foregroundColor(.yellow)
        case .message : Image(systemName: "circle").font(.body).foregroundColor(.green)
        }
    }
    
    /// Event color
    var color : Color{
        switch self{
            case .error: return .red
            case .warning: return .yellow
            case .message : return .green
        }
    }
}
