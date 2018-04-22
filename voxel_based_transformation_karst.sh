#!/bin/bash


SUB_MOVE=$1
SUB_STAT=$2


#------------------------------------------------------------------------------
# Renaming files
#------------------------------------------------------------------------------

echo "renaming files"
T1W_MOVE=`jq -r '.t1_moving' config.json`
FA_MOVE=`jq -r '.fa_moving' config.json`
T1W_STAT=`jq -r '.t1_static' config.json`
FA_STAT=`jq -r '.fa_static' config.json`
cp $T1W_MOVE ./sub-${SUB_MOVE}_space-dwi_T1w.nii.gz;
cp $FA_MOVE ./sub-${SUB_MOVE}_var-FNA_FA.nii.gz
cp $T1W_STAT ./sub-${SUB_STAT}_space-dwi_T1w.nii.gz
cp $FA_STAT ./sub-${SUB_STAT}_var-FNA_FA.nii.gz

T1W_ANT_PRE=sub-${SUB_MOVE}_space_${SUB_STAT}_var-t1w_
FA_ANT_PRE=sub-${SUB_MOVE}_space_${SUB_STAT}_var-fa_


#------------------------------------------------------------------------------
# ANTS Registration of structural images
#------------------------------------------------------------------------------

# Warp Computation
ANTS 3 -m CC[${T1W_STAT},${T1W_MOVE},1,5] -t SyN[0.5] \
    -r Gauss[2,0] -o $T1W_ANT_PRE -i 30x90x20 --use-Histogram-Matching
ANTS 3 -m CC[${FA_STAT},${FA_MOVE},1,5] -t SyN[0.5] \
    -r Gauss[2,0] -o $FA_ANT_PRE -i 30x90x20 --use-Histogram-Matching


#------------------------------------------------------------------------------
# ANTS Registration of structural images
#------------------------------------------------------------------------------

mv ${T1W_ANT_PRE}Warp.nii.gz ${T1W_ANT_PRE}warp.nii.gz
mv ${T1W_ANT_PRE}InverseWarp.nii.gz ${T1W_ANT_PRE}invwarp.nii.gz
mv ${T1W_ANT_PRE}Affine.txt ${T1W_ANT_PRE}affine.txt

mv ${FA_ANT_PRE}Warp.nii.gz ${FA_ANT_PRE}warp.nii.gz
mv ${FA_ANT_PRE}InverseWarp.nii.gz ${FA_ANT_PRE}invwarp.nii.gz
mv ${FA_ANT_PRE}Affine.txt ${FA_ANT_PRE}affine.txt
