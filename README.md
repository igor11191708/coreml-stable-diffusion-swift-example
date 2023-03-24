# CoreML stable diffusion image generation example

The example app to run text-to-image or image-to-image models from [Hugging Face](https://huggingface.co) to generate images

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/app.png) 

## How to run the example app

### 1. Download a prepared *split einsum* model from Hugging Face Hub.
You can follow to the set of ready to use models from the UI of the example app by clicking on the buttons **Apple models** or **CoreML models**

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/local_button.png) 
or follow the links 
- [Apple models](https://huggingface.co/apple) 
- [Core ML community models](https://huggingface.co/coreml) 

The example app supports **split-einsum** models. I decided to support in the example app only this type of models because they are the fastest in terms of image generation more to read is here [Deploying Transformers on the Apple Neural Engine](https://machinelearning.apple.com/research/neural-engine-transformers)

To get positive result from the app example download only this type of models.

#### PyTorch to CoreML
if you want to prepare model bundle on your own take a look on this tutorial
[Stable Diffusion on Apple Silicon](https://www.youtube.com/watch?v=uY_Ty-F0CG8&list=LL&index=2)

### 2. Put the models to the working model directory
Click the button **Local models** and move there downloaded models
  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/local_button.png)   
  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/local_models_folder.png) 

### 3. Run the app example
Take a look on [the video demonstration](https://youtu.be/oaaJums6f8c)

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/coreml_stable_diffusion_video.gif) 

## SwiftUI example for the package

[CoreML stable diffusion image generation](https://github.com/The-Igor/coreml-stable-diffusion-swift)

## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)
- Go to Product > Build Documentation or **⌃⇧⌘ D**

Disclaimer : It's not official Hugging Face app for running text-to-image or image-to-image models from [Hugging Face](https://huggingface.co) to generate images. 
