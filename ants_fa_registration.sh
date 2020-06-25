#!/bin/bash

FA_MOVE=$1
MD_MOVE=$2
RD_MOVE=$3
AD_MOVE=$4
template=FMRIB58_FA_1mm.nii.gz

#------------------------------------------------------------------------------
# ANTS Transformation of structural images based on FA
#------------------------------------------------------------------------------

# Warp Computation
ANTS 3 -m CC[${template},${FA_MOVE},1,5] -t SyN[0.5] \
    -r Gauss[2,0] -o -i 30x90x20 --use-Histogram-Matching

mkdir warp
cp 1Warp.nii.gz warp/warp.nii.gz
cp 1InverseWarp.nii.gz warp/inverse-warp.nii.gz

#------------------------------------------------------------------------------
# tensor Registration to the template
#------------------------------------------------------------------------------

echo "Applying the warp..."
mkdir tensor_aligned
OUT=tensor_aligned

WarpImageMultiTransform 3  \
	${FA_MOVE} \
	${OUT}/fa.nii.gz \
	1Warp.nii.gz 1Affine.txt

WarpImageMultiTransform 3  \
	${MD_MOVE} \
	${OUT}/md.nii.gz \
	1Warp.nii.gz 1Affine.txt

WarpImageMultiTransform 3  \
	${RD_MOVE} \
	${OUT}/rd.nii.gz \
	1Warp.nii.gz 1Affine.txt

WarpImageMultiTransform 3  \
	${AD_MOVE} \
	${OUT}/ad.nii.gz \
	1Warp.nii.gz 1Affine.txt

#------------------------------------------------------------------------------
# Checks
#------------------------------------------------------------------------------

if [ -z "$(ls -A -- "warp")" ]; then    
	echo "Transformation failed."
	exit 1
elif [ -z "$(ls -A -- "tensor_aligned")" ]; then    
	echo "Registration failed."
	exit 1
else    
	echo "Transformation and registration done."
fi
