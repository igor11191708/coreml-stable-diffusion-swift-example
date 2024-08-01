# CoreML stable diffusion image generation example

The example app for running text-to-image or image-to-image models to generate images using [Apple's Core ML Stable Diffusion implementation](https://github.com/apple/ml-stable-diffusion)

### Performance

 The speed can be unpredictable. Sometimes a model will suddenly run a lot slower than before. It appears as if Core ML is trying to be smart in how to schedule things, but doesn’t always optimal.

## SwiftUI example for the package

[CoreML stable diffusion image generation](https://github.com/The-Igor/coreml-stable-diffusion-swift)

  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_08.gif)
 
 ## How to use
  
1. Place at least one of your prepared split_einsum models into the ‘Local Models’ folder. Find the ‘Document’ folder through the interface by tapping on the ‘Local Models’ button. If the folder is empty, then create a folder named ‘models’. Refer to the folders’ hierarchy in the image below for guidance.
The example app supports only ``split_einsum`` models. In terms of performance ``split_einsum`` is the fastest way to get result.
2. Pick up the model that was placed at the local folder from the list. Click update button if you added a model while app was launched
3. Enter a prompt or pick up a picture and press "Generate" (You don't need to prepare image size manually) It might take up to a minute or two to get the result


  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_03.png)

## Model set example
[coreml-stable-diffusion-2-base](https://huggingface.co/pcuenq/coreml-stable-diffusion-2-base/blob/main/coreml-stable-diffusion-2-base_split_einsum_compiled.zip )


## Documentation(API)
- You need to have Xcode 13 installed in order to have access to Documentation Compiler (DocC)

- Go to Product > Build Documentation or **⌃⇧⌘ D**

  ![The concept](https://github.com/The-Igor/coreml-stable-diffusion-swift-example/blob/main/img/img_01.png)


## Case study
[Deploying Transformers on the Apple Neural Engine](https://machinelearning.apple.com/research/neural-engine-transformers)


