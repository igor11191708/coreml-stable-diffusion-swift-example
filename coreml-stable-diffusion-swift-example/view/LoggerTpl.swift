//
//  LoggerTpl.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 23.03.2023.
//

import SwiftUI

@available(macOS 13.1, *)
struct LoggerTpl: View {
    
    @EnvironmentObject var model : ViewModel
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View {
        VStack(alignment: .leading){
            List(model.logEvents, id : \.self){ item in
                let color = item.type.color
                let image = item.type.imageTpl
                HStack{
                    image
                    Text(item.text)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(10)
                .background(bgTpl(color))
            }
            .scrollContentBackground(.hidden)
            ZStack{
                cleanTpl
            }.frame(maxWidth: .infinity, alignment: .trailing)
        }
    }
    
    @ViewBuilder
    private func bgTpl(_ color : Color) -> some View{
        ZStack{
            Capsule().fill(.gray.opacity(0.25))
            Capsule().stroke(color, lineWidth: 0.5)
        }
    }
    
    /// Remove result image
    @ViewBuilder
    private var cleanTpl: some View{
        Button{
            model.cleanEventLog()
        }label: {
            HStack{
                Image(systemName: "x.circle")
                    .font(.system(size: 14))
            }
        }
        .disabled(model.logEvents.isEmpty)
        .padding(.trailing, 25)
        .padding(.bottom, 25)
    }
}

