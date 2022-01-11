[![Abcdspec-compliant](https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg)](https://github.com/brain-life/abcd-spec)
[![Run on Brainlife.io](https://img.shields.io/badge/Brainlife-bl.app.118-blue.svg)](https://doi.org/10.25663/brainlife.app.118)

# app-ants-FA-registration
This App computes a non-linear registration of Diffusion Tensor Image Scalars in MNI space using the Advanced Normalization Tools (ANTs) algorithm. First, a non-linear warp is computed to register the Fractional Anisotropy (FA) image to the template image, which is the FMRIB58_FA_1mm.nii.gz. Then, the same transformation is applied to all Diffusion Tensor Image Scalars.

### Authors
- Giulia Bertò (giulia.berto.4@gmail.com)

### Contributors
- Paolo Avesani (avesani@fbk.eu)

### Funding Acknowledgement
brainlife.io is publicly funded and for the sustainability of the project it is helpful to Acknowledge the use of the platform. We kindly ask that you acknowledge the funding below in your publications and code reusing this code.

[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-1636893](https://img.shields.io/badge/NSF_BCS-1636893-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-ACI-1916518](https://img.shields.io/badge/NSF_ACI-1916518-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1916518)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://grantome.com/grant/NIH/R01-EB029272-01)

### Citations
We kindly ask that you cite the following articles when publishing papers and code using this code. 

1. Avants, B.B., Epstein, C.L., Grossman, M., Gee, J.C., 2008. [Symmetric diffeomorphic image registration with cross-correlation: evaluating automated labeling of elderly and neurodegenerative brain.](https://www.sciencedirect.com/science/article/pii/S1361841507000606) Med. Image Anal. 12 (1), 26–41. doi: 10.1016/j.media.2007.06.004.

2. Avesani, P., McPherson, B., Hayashi, S. et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. Sci Data 6, 69 (2019). [https://doi.org/10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Running the app
### On [Brainlife.io](http://brainlife.io/) 
You can submit this App online at https://doi.org/10.25663/brainlife.app.118 via the “Execute” tab.

Input: \
Diffusion Tensor Image Scalars (tensor datatype). Up to now, supported scalars are: FA (Fractional Anisotropy), MD (Mean Diffusivity), RD (Radial Diffusivity), and AD (Axial Diffusivity).

Output: \
Diffusion Tensor Image Scalars (tensor datatype) registered in MNI space.

### Running locally
1. git clone this repo.
2. Inside the cloned directory, create `config.json` with something like the following content with paths to your input files:
```
{
   "fa":    "./tensor/fa.nii.gz",
   "md":    "./tensor/md.nii.gz",
   "rd":    "./tensor/rd.nii.gz",
   "ad":    "./tensor/ad.nii.gz",
} 
```
3. Launch the App by executing `main`.
```
./main
```

### Output
The main output of this App is the Diffusion Tensor Image Scalars (tensor datatype) registered in MNI space. A secondary output is the warp (and inverse-warp) computed to perform the registration.

### Dependencies
This App only requires [singularity](https://sylabs.io/singularity/) to run. If you don't have singularity, you will need to install following dependencies:
* ANTs >=2: https://github.com/ANTsX/ANTs

#### MIT Copyright (c) 2020 Bruno Kessler Foundation (FBK)
