# CoreML stable diffusion image generation example

The example app for running text-to-image or image-to-image models to generate images using [Apple's Core ML Stable Diffusion implementation](https://github.com/apple/ml-stable-diffusion)

## SwiftUI example for the package

[CoreML stable diffusion image generation](https://github.com/The-Igor/coreml-stable-diffusion-swift)

  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_08.gif)
 
 ## How to use
  
1. Put at least one of your prepared ``split_einsum`` model into the local model folder (The example app supports only ``split_einsum`` models. In terms of performance ``split_einsum`` is the fastest way to get result)
2. Pick up the model that was placed at the local folder from the list. Click update button if you added a model while app was launched
3. Enter a prompt or pick up a picture and press "Generate" (You don't need to prepare image size manually)

  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_03.png)

## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)

- Go to Product > Build Documentation or **⌃⇧⌘ D**

  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_01.png)
