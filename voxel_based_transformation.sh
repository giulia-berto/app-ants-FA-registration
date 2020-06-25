#!/bin/bash


FA_MOVE=$1
template=FMRIB58_FA_1mm.nii.gz

#------------------------------------------------------------------------------
# ANTS Transformation of structural images
#------------------------------------------------------------------------------

# Warp Computation
ANTS 3 -m CC[${template},${FA_MOVE},1,5] -t SyN[0.5] \
    -r Gauss[2,0] -o -i 30x90x20 --use-Histogram-Matching

#------------------------------------------------------------------------------
# Renaming files
#------------------------------------------------------------------------------

#cp ${FA_ANT_PRE}Warp.nii.gz var-fa_warp.nii.gz
#cp ${FA_ANT_PRE}InverseWarp.nii.gz var-fa_inverse-warp.nii.gz

#mv ${FA_ANT_PRE}Warp.nii.gz ${FA_ANT_PRE}warp.nii.gz
#mv ${FA_ANT_PRE}InverseWarp.nii.gz ${FA_ANT_PRE}invwarp.nii.gz
#mv ${FA_ANT_PRE}Affine.txt ${FA_ANT_PRE}affine.txt

#------------------------------------------------------------------------------
# FA maps Registration on the SUB_STAT
#------------------------------------------------------------------------------

echo "Applying the warp..."

WarpImageMultiTransform 3  \
	${FA_MOVE} \
	$OUT/fa_aligned.nii.gz \
	Warp.nii.gz Affine.txt
