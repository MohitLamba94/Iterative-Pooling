# Iterative-Pooling
Accepted in ICASSP 2020. Images captured nowadays are of varying dimensions with smartphones and DSLR's allowing users to choose from a list of available image resolutions. It is therefore imperative for forensic algorithms such as resampling detection to scale well for images of varying dimensions. However, in our experiments, we observed that many state-of-the-art forensic algorithms are sensitive to image size and their performance quickly degenerates when operated on images of diverse dimensions despite re-training them using multiple image sizes. To handle this issue, we propose a novel pooling strategy called ITERATIVE POOLING. This pooling strategy can dynamically adjust input tensors in a discrete without much loss of information as in ROI Max-pooling. This pooling strategy can be used with any of the existing deep models and for demonstration purposes, we show its utility on Resnet-18 for the case of resampling detection a fundamental operation for any image sought of image manipulation. Compared to existing strategies and Max-pooling it gives up to 7-8% improvement on public datasets.

The arXiv version of the paper can found here.

# How to use?
We provide the jupyter file containing the test code with all the dependencies in a single file. For everyones reference the file is pre-computed with results. However for running it on your own system you need to download the dataset and checkpoints from our google drive link https://drive.google.com/drive/folders/1orHUf8YHZpjvGj4SwPJL6P108BVhIYQa?usp=sharing.

It should run well for Pytorch>=1.00 and torchvision>0.2.

# The dataset
We only release the test data containing 25,000 images with images of varying of 5 different dimensions and having undergone the JPEG+Resampling+JPEG manipulation with 5 different resampling factors. For details refer the paper.
For generating the full dataset we additionally provide the MATLAB '.m' file. The only dependancy is that one must have the RAISE datset (as mentioned in the paper) downloaded on ones system.

# Cite us
If you find any information provided here useful please cite us,
xxxxxx
