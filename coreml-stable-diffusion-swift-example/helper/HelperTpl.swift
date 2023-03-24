//
//  HelperTpl.swift
//  
//
//  Created by Igor on 23.03.2023.
//

import SwiftUI

/// - Parameters:
///   - width: Width
///   - height: Height
///   - systemName: Name for the image
/// - Returns: Empty tpl
@available(macOS 13.1, *)
@ViewBuilder
public func emptyImageTpl(width: CGFloat? = nil, height: CGFloat? = nil, systemName: String = "photo" ) -> some View{
    Image(systemName: systemName)
        .resizable()
        .renderingMode(.template)
        .scaledToFit()
        .frame(width: width, height: height)
}
