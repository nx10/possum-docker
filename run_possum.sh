#!/bin/bash

set -x

DIR_OUTPUT="/output/possum_out"

mkdir -p "$DIR_OUTPUT"

# > ls $FSLDIR/data/possum/
# MRpar_1.5T              b0_ppm.nii.gz   motionAllLarge_0.12s    motionRzMed_60s
# MRpar_3T                b0extra.nii.gz  motionAllLarge_60s      slcprof
# activation3D.nii.gz     b0timecourse    motionInPlaneLarge_12s  zeromotion
# activation3Dtimecourse  brain.nii.gz    motionRzLarge_0.12s

if [ ! -f "$DIR_OUTPUT/slcprof" ]
then

cp "$FSLDIR/data/possum/brain.nii.gz" "$DIR_OUTPUT/brain.nii.gz"
cp "$FSLDIR/data/possum/zeromotion"   "$DIR_OUTPUT/motion"
cp "$FSLDIR/data/possum/MRpar_3T"     "$DIR_OUTPUT/MRpar"
cp "$FSLDIR/data/possum/slcprof"      "$DIR_OUTPUT/slcprof"

else
echo "Skip copy files"
fi

if [ ! -f "$DIR_OUTPUT/pulse" ]
then

pulse \
    -i "$DIR_OUTPUT/brain" \
    -o "$DIR_OUTPUT/pulse" \
    --te=0.030 \
    --tr=3 \
    --trslc=2.997 \
    --nx=64 \
    --ny=64 \
    --dx=0.004 \
    --dy=0.004 \
    --maxG=0.055 \
    --riset=0.00022 \
    --bw=100000 \
    --numvol=1 \
    --numslc=1 \
    --slcthk=0.001 \
    --zstart=0.07 \
    --seq=epi \
    --slcdir=z+ \
    --readdir=x+ \
    --phasedir=y+ \
    --gap=0.0 \
    -v \
    --cover=100 \
    --angle=90

else
echo "Skip pulse"
fi

if [ ! -f "$DIR_OUTPUT/matrix" ]
then

possumX \
    "$DIR_OUTPUT" \
    -n 1 \
    -t 2 \
    -s 10000

else
echo "Skip possumX"
fi