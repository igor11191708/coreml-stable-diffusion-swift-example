# CoreML stable diffusion image generation example app
### Please star the repository if you believe continuing the development of this package is worthwhile. This will help me understand which package deserves more effort.


## [Swift package source](https://github.com/igor11191708/coreml-stable-diffusion-swift)
## [Documentation(API)](https://swiftpackageindex.com/igor11191708/coreml-stable-diffusion-swift/main/documentation/coreml_stable_diffusion_swift)

The example app for running text-to-image or image-to-image models to generate images using [Apple's Core ML Stable Diffusion implementation](https://github.com/apple/ml-stable-diffusion)

![The concept](https://github.com/igor11191708/coreml-stable-diffusion-swift-example/blob/main/img/img_08.gif)

 ## How to get generated image

### Step 1 
Place at least one of your prepared split_einsum models into the ‘Local Models’ folder. Find the ‘Document’ folder through the interface by tapping on the ‘Local Models’ button. If the folder is empty, then create a folder named ‘models’. Refer to the folders’ hierarchy in the image below for guidance.
The example app supports only ``split_einsum`` models. In terms of performance ``split_einsum`` is the fastest way to get result.
### Step 2
Pick up the model that was placed at the local folder from the list. Click update button if you added a model while app was launched
### Step 3 
Enter a prompt or pick up a picture and press "Generate" (You don't need to prepare image size manually) It might take up to a minute or two to get the result

![The concept](https://github.com/igor11191708/coreml-stable-diffusion-swift-example/blob/main/img/img_03.png)

### Typical set of files for a model und the purpose of each file

| File Name                            | Description                                                      |
|--------------------------------------|------------------------------------------------------------------|
| `TextEncoder.mlmodelc`               | Encodes input text into a vector space for further processing.   |
| `Unet.mlmodelc`                      | Core model handling the transformation of encoded vectors into intermediate image representations. |
| `UnetChunk1.mlmodelc`                | First segment of a segmented U-Net model for optimized processing in environments with memory constraints. |
| `UnetChunk2.mlmodelc`                | Second segment of the segmented U-Net model, completing the tasks started by the first chunk. |
| `VAEDecoder.mlmodelc`                | Decodes the latent representations into final image outputs.     |
| `VAEEncoder.mlmodelc`                | Compresses input image data into a latent space for reconstruction or further processing. |
| `SafetyChecker.mlmodelc`             | Ensures generated content adheres to safety guidelines by checking against predefined criteria. |
| `vocab.json`                         | Contains the vocabulary used by the text encoder for tokenization and encoding processes. |
| `merges.txt`                         | Stores the merging rules for byte-pair encoding used in the text encoder. |


## Model set example
[coreml-stable-diffusion-2-base](https://huggingface.co/pcuenq/coreml-stable-diffusion-2-base/blob/main/coreml-stable-diffusion-2-base_split_einsum_compiled.zip )

### Performance

 The speed can be unpredictable. Sometimes a model will suddenly run a lot slower than before. It appears as if Core ML is trying to be smart in how to schedule things, but doesn’t always optimal.

### Deploying Transformers on the Apple Neural Engine [Case study](https://machinelearning.apple.com/research/neural-engine-transformers)


