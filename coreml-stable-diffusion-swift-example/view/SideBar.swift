//
//  SideBar.swift
//  stable-diffusion-swift-example
//
//  Created by Igor on 22.03.2023.
//

import SwiftUI
import coreml_stable_diffusion_swift

@available(macOS 13.1, *)
struct SideBar: View{
    
    @EnvironmentObject var model : ViewModel
    
    /// Current task generating an image
    @State private var task : Task<(), Never>?
    
    /// Scheduler description
    private var schedulerDescription : String{
        model.scheduler.description
    }
    
    // MARK: - Life circle
    
    /// The type of view representing the body of this view.
    var body: some View{
        VStack{
            ScrollView{
                VStack(alignment: .leading, spacing: 10){
                    headerTpl
                    Divider()
                    Group{
                        modelsPickerTpl
                        schedulerPickerTpl
                        Prompts()
                    }
                    .font(.system(size: 12, weight: .regular))
                    InputImageView()
                    Group{
                        SlidersView()
                    }
                    .font(.system(size: 12, weight: .regular)) 
                }.padding(.leading, 10)
                    .padding(.trailing, 15)
            }
            Divider()
            VStack{
                generateTpl
                cancelGenerateTpl
            }.padding()
        }
       .navigationTitle("Models")
       .navigationSplitViewColumnWidth(min: 300, ideal: 350, max: 600)
    }
    
    // MARK: - Private Tpl
    
    @ViewBuilder
    private var schedulerPickerTpl: some View{
        VStack{
            Text(schedulerDescription)
                .font(.caption2)
                .foregroundColor(.gray)
            Picker("".uppercased(),selection: $model.scheduler) {
                let data = GenerativeManager.schedulers
                ForEach(data, id : \.self){ item in
                    Text(item.name).tag(item.name)
                }
            }
        }
    }
    
    @ViewBuilder
    private var headerTpl : some View{
        HStack{
            Image(systemName: "gear")
            Text("Parameters".uppercased())
        }.font(.system(size: 14))
            .foregroundColor(.white.opacity(0.75))
    }
    
    /// Check fields validity
    private var isNotValid : Bool{
        (model.selected.isEmpty || model.selected == "empty") || (model.prompt.isEmpty && model.inputImage == nil)
    }
    
    private var isRunning : Bool{
        model.progress == .running
    }
    
    private var isCanceling : Bool{
        model.progress == .canceling
    }
    
    /// Start task
    private func startTask(){
        task = Task{
            await model.generate()
        }
    }
        
    /// Cancel task
    private func cancelTask(){
        task?.cancel()
        task = nil
        model.setCancellation()
    }
    
    // MARK: - Private Tpl
    
    @ViewBuilder
    private var generateTpl : some View{
        Button{
            cancelTask()
            startTask()
        }
        label: {
            Text("Generate")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .disabled(isNotValid || isRunning || isCanceling)
    }
    
    @ViewBuilder
    private var cancelGenerateTpl : some View{
        Button{
            cancelTask()
        }
        label: {
            Text("Cancel")
                .frame(maxWidth: .infinity)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!isRunning)
    }
    
    @ViewBuilder
    private var modelsPickerTpl : some View{
        HStack{
            Picker("Models".uppercased(),selection: $model.selected) {
                Text("Empty").tag("empty")
                ForEach(model.models, id : \.self){ item in
                    HStack{
                        Image(systemName: "photo.circle")
                        Text(item.name)
                    }.tag(item.name)
                }
            }
            .disabled(model.loadingModels)
            Button{
                Task{
                   await model.loadModels()
                }
            }label: {
                Image(systemName: "arrow.counterclockwise")
            }
        }.onChange(of: model.selected){
            model.updateModel($0)
        }
    }
}
