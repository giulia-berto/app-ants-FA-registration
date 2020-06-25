#!/bin/bash


FA_MOVE=$1
FA_STAT=$2

FA_ANT_PRE=sub-${SUB_MOVE}_space_${SUB_STAT}_var-fa_


#------------------------------------------------------------------------------
# ANTS Transformation of structural images
#------------------------------------------------------------------------------

# Warp Computation
ANTS 3 -m CC[${FA_STAT},${FA_MOVE},1,5] -t SyN[0.5] \
    -r Gauss[2,0] -o $FA_ANT_PRE -i 30x90x20 --use-Histogram-Matching

#------------------------------------------------------------------------------
# Renaming files
#------------------------------------------------------------------------------

cp ${FA_ANT_PRE}Warp.nii.gz var-fa_warp.nii.gz
cp ${FA_ANT_PRE}InverseWarp.nii.gz var-fa_inverse-warp.nii.gz

mv ${FA_ANT_PRE}Warp.nii.gz ${FA_ANT_PRE}warp.nii.gz
mv ${FA_ANT_PRE}InverseWarp.nii.gz ${FA_ANT_PRE}invwarp.nii.gz
mv ${FA_ANT_PRE}Affine.txt ${FA_ANT_PRE}affine.txt


