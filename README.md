# Multi-patch Aggregation Models for Resampling Detection
Images captured nowadays are of varying dimensions with smartphones and DSLR's allowing users to choose from a list of available image resolutions. It is therefore imperative for forensic algorithms such as resampling detection to scale well for images of varying dimensions. However, in our experiments, we observed that many state-of-the-art forensic algorithms are sensitive to image size and their performance quickly degenerates when operated on images of diverse dimensions despite re-training them using multiple image sizes. To handle this issue, we propose a novel pooling strategy called ITERATIVE POOLING. This pooling strategy can dynamically adjust input tensors in a discrete without much loss of information as in ROI Max-pooling. This pooling strategy can be used with any of the existing deep models and for demonstration purposes, we show its utility on Resnet-18 for the case of resampling detection a fundamental operation for any image sought of image manipulation. Compared to existing strategies and Max-pooling it gives up to 7-8% improvement on public datasets.

The arXiv version of the paper can found at https://arxiv.org/abs/2003.01364.

# How to use the code?
We provide the jupyter file containing the test code with all the dependencies in a single file. For reference the file is pre-computed with results. However for running it on your own system you need to download the dataset and checkpoints from our google drive link https://drive.google.com/drive/folders/1orHUf8YHZpjvGj4SwPJL6P108BVhIYQa?usp=sharing.

It should run well for Pytorch>=1.00 and torchvision>=0.2.

# The JPEG+Resampling+JPEG Dataset
To run the jupyter file you just need test data containing 15,000 images. However if you wish to download the full dataset which is over a 100GB, the following link can be used https://drive.google.com/drive/folders/1lB2zWreQJPyXF2Iy8xvdfuZQoa-OTWqd?usp=sharing. The complete dataset has 75,000 training images; 15,000 validation images and another 15,000 images for testing. For each set the images are equally divided into 5 resampling factors namely-0.6,0.8,1,1.2 and 1.4. In its current version the dataset consists of images of 5 different resolutions. For details refer the paper.
Our code does not uses the validation dataset during the training phase and so the validation dataset can also be used for evaluation.
We additionally provide a MATLAB file which illustrates how this dataste was created for image resolution of 1024x1024 and also describes how to add rotation to create JPEG+Roation+Resampling+JPEG manipulation dataste which is much harder case to deal with. 


# Cite us
If you find any information provided here useful please cite us,

Lamba, Mohit, et al. "Multi-Patch Aggregation Models for Resampling Detection." 2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP).
