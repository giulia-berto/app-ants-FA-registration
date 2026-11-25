<h1 align="center">ANTs tensor registration based on FA</h1>

<p align="center">
  Registers DTI scalar maps (FA, MD, RD, AD) to the FMRIB58 or IIT FA template with an ANTs SyN warp computed on FA, and outputs the aligned maps and the warp.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.118"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.118-blue.svg" alt="Run on brainlife.io"></a>
</p>

## At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Registers DTI scalar maps (FA, MD, RD, AD) to the FMRIB58 or IIT FA template with an ANTs SyN warp computed on FA, and outputs the aligned maps and the warp.**

Computes a nonlinear ANTs SyN registration (cross-correlation metric) of the subject FA map to the chosen FA template (FMRIB58_FA_1mm or IITmean_FA, both bundled in the repo), then applies the same warp and affine to FA, MD, RD and AD with WarpImageMultiTransform. Use it to bring tensor scalar maps into MNI template space for group comparisons. The input tensor must contain fa, md, rd and ad.

| | |
|---|---|
| **Inputs** | `neuro/tensor` |
| **Outputs** | `neuro/transform/nifti` · `neuro/tensor` |
| **Container** | `brainlife/ants:2.2.0` |
| **Resources** | 4 CPUs · 8 GB memory · 1 h walltime |
| **Run it** | [doi.org/10.25663/brainlife.app.118](https://doi.org/10.25663/brainlife.app.118) |

#### Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `0` | `neuro/tensor` | yes | tensor to be aligned to the template |

#### Outputs

| Output | Datatype | Description |
|---|---|---|
| `warp` | `neuro/transform/nifti` | non linear warp (warp and inverse-warp) |
| `tensor_aligned` | `neuro/tensor` | aligned tensor |

<details>
<summary><b>Parameters</b> (1)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `fa_template` | enum | `FMRIB58_FA_1mm` | FA template Options: `FMRIB58_FA_1mm`, `IITmean_FA`. |

</details>

<!-- brainlife-app:end -->

## Running the App

### On brainlife.io

Open the App at [doi.org/10.25663/brainlife.app.118](https://doi.org/10.25663/brainlife.app.118), choose `neuro/tensor` from your project, set the parameters and press **Execute**. The results are saved to your project as `neuro/transform/nifti`, `neuro/tensor`.

### Locally

You need [Singularity/Apptainer](https://apptainer.org/) (the App runs in `brainlife/ants:2.2.0`), [`jq`](https://jqlang.github.io/jq/).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the parameters:

   ```json
   {
       "fa_moving": "/path/to/0/fa_moving",
       "md_moving": "/path/to/0/md_moving",
       "rd_moving": "/path/to/0/rd_moving",
       "ad_moving": "/path/to/0/ad_moving",
       "fa_template": "FMRIB58_FA_1mm"
   }
   ```

3. Run `./main`.

## Troubleshooting

- **ANTs transformation failed**: Check that fa, md, rd and ad are present in the input tensor and the FA map is reasonable.

## On [Brainlife.io](http://brainlife.io/)

You can submit this App online at https://doi.org/10.25663/brainlife.app.118 via the “Execute” tab.

Input: \
Diffusion Tensor Image Scalars (tensor datatype). Up to now, supported scalars are: FA (Fractional Anisotropy), MD (Mean Diffusivity), RD (Radial Diffusivity), and AD (Axial Diffusivity).

Output: \
Diffusion Tensor Image Scalars (tensor datatype) registered in MNI space.

## Citing

If you use this App, please cite it, the software it builds on and brainlife.io:

- ANTs tensor registration based on FA. brainlife.io App. [doi:10.25663/brainlife.app.118](https://doi.org/10.25663/brainlife.app.118)
- Avants BB, Epstein CL, Grossman M, Gee JC. Symmetric diffeomorphic image registration with cross-correlation. Med Image Anal 12(1):26-41 (2008). [doi:10.1016/j.media.2007.06.004](https://doi.org/10.1016/j.media.2007.06.004)
- Avants et al. A reproducible evaluation of ANTs similarity metric performance in brain image registration. *NeuroImage* 54:2033-2044 (2011). [doi:10.1016/j.neuroimage.2010.09.025](https://doi.org/10.1016/j.neuroimage.2010.09.025)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)

## Authors

- Giulia Bertò

**Contributors**

- Paolo Avesani

## Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io, which runs this App, is publicly funded by Wellcome, the U.S. National Institutes of Health and the U.S. National Science Foundation; acknowledging that support helps keep it running.</sub>
