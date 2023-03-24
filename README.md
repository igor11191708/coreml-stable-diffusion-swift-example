# CoreML stable diffusion image generation example

The example app for running text-to-image or image-to-image models from [Hugging Face](https://huggingface.co) to generate images

  ![Http requests](https://github.com/The-Igor/coreml-stable-diffusion-swift/blob/main/Sources/img/app.png) 

## Official Huggingface/swift-coreml-diffusers
[Swift app demonstrating Core ML Stable Diffusion](https://github.com/huggingface/swift-coreml-diffusers)

## How to run the example app

### 1. Download a prepared *split einsum* model from Hugging Face Hub.

- [Apple models](https://huggingface.co/apple) 
- [pcuenq/coreml-stable-diffusion-2-base](https://huggingface.co/pcuenq/coreml-stable-diffusion-2-base/tree/main) 

The example app supports **split-einsum** models. I decided to support in the example app only this type of models because they are the fastest in terms of image generation more to read is here [Deploying Transformers on the Apple Neural Engine](https://machinelearning.apple.com/research/neural-engine-transformers)

To get positive result from the app example use only *split einsum* type of models.

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

Disclaimer : It's not official Hugging Face package for running text-to-image or image-to-image models from [Hugging Face](https://huggingface.co) to generate images. By launching and downloading models from Hugging Face, you take responsibility for yourself. I have no relationship with the model developers on Hugging Face. Use at your own discretion.
