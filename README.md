# Multi-patch Aggregation Models for Resampling Detection
Images captured nowadays are of varying dimensions with smartphones and DSLR's allowing users to choose from a list of available image resolutions. It is therefore imperative for forensic algorithms such as resampling detection to scale well for images of varying dimensions. However, in our experiments, we observed that many state-of-the-art forensic algorithms are sensitive to image size and their performance quickly degenerates when operated on images of diverse dimensions despite re-training them using multiple image sizes. To handle this issue, we propose a novel pooling strategy called ITERATIVE POOLING. This pooling strategy can dynamically adjust input tensors in a discrete without much loss of information as in ROI Max-pooling. This pooling strategy can be used with any of the existing deep models and for demonstration purposes, we show its utility on Resnet-18 for the case of resampling detection a fundamental operation for any image sought of image manipulation. Compared to existing strategies and Max-pooling it gives up to 7-8% improvement on public datasets.

***The arXiv version of the paper can found at [arXiv.org](https://arxiv.org/abs/2003.01364).***

[![Watch the project video](https://raw.githubusercontent.com/MohitLamba94/Iterative-Pooling/master/pics/icasspVideoPic.png)](https://www.youtube.com/watch?v=Ol3VFph2F4Y&feature=youtu.be)


# Sample Output

|Image Resolution after Resampling|Patch Size|
|---:|:---|
|< 1024x1024 | 128x128|
|~ 1024x1024 but < 2000x2000 | 256x256|
|>2000x2000 | 512x512|

**Original Image size:** 512x512 <br/>
**Patch size:** 128x128 <br/>
Resampling Factor : Correctly classified images / Total test images <br/>
 0.6:968/1001 0.8:976/1001 1:961/1001 1.2:935/1001 1.4:936/1001
 
**Original Image size:** 1024x1024 <br/>
**Patch size:** 128x128 <br/>
Resampling Factor : Correctly classified images / Total test images <br/>
0.6:979/1001

**Original Image size:** 1024x1024 <br/>
**Patch size:** 256x256 <br/>
Resampling Factor : Correctly classified images / Total test images <br/>
0.8:989/1001 1:995/1001 1.2:997/1001 1.4:952/1001

**Original Image size:** greater than 1024x1024 <br/>
**Patch size:** 256x256 <br/>
Resampling Factor : Correctly classified images / Total test images <br/>
0.6:991/1001 0.8:959/1001

**Original Image size:** greater than 1024x1024 <br/>
**Patch size:** 512x512 <br/>
Resampling Factor : Correctly classified images / Total test images <br/>
1:994/1001 1.2:963/1001 1.4:999/1001

# How to use the code?
- We provide the jupyter file containing the test code with all the dependencies in a single file. For reference the file is pre-computed with results. 
- However for running it on your own system you need to [download](https://drive.google.com/drive/folders/1orHUf8YHZpjvGj4SwPJL6P108BVhIYQa?usp=sharing) the test dataset containing 15000 images and model checkpoint.

It should run well for Pytorch>=1.00 and torchvision>=0.2.

# The Dataset
- To run the jupyter file you just need test data containing 15,000 images. 
- However if you wish to download the full JPEG+Resampling+JPEG dataset which is over a 100GB, use this [link](https://drive.google.com/drive/folders/1lB2zWreQJPyXF2Iy8xvdfuZQoa-OTWqd?usp=sharing)
- The complete dataset has ***75,000 training images***; ***15,000 validation images*** and another ***15,000 images for testing***. 
- For each set the images are equally divided into 5 resampling factors namely - 0.6,0.8,1,1.2 and 1.4. In its current version the dataset consists of images of 5 different resolutions ***512×512, 1024×1024, 3008×2000, 4288×2848 and 4928×3264***.
- This is charachteristicly distinct from recent works that evaluate on images of fixed resolution &mdash; mostly of VGA resolution. Refer Table 1 in the main paper.


Our code does not uses the validation dataset during the training phase and so the validation dataset can also be used for evaluation.
We additionally provide a MATLAB file which illustrates how this dataste was created for image resolution of 1024x1024 and also describes how to add rotation to create JPEG+Roation+Resampling+JPEG manipulation dataste which is much harder case to deal with. 


# Cite us
If you find any information provided here useful please cite us,
```
Lamba Mohit, and Kaushik Mitra. "Multi-Patch Aggregation Models for Resampling Detection." ICASSP 2020-2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP). IEEE, 2020.
```

OR use the BibTex
```
@inproceedings{lamba2020multi,
  title={multi-patch aggregation models for resampling detection},
  author={Lamba, Mohit and Mitra, Kaushik},
  booktitle={ICASSP 2020-2020 IEEE International Conference on Acoustics, Speech and Signal Processing (ICASSP)},
  pages={2967--2971},
  year={2020},
  organization={IEEE}
}
```
