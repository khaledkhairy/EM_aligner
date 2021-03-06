#!/bin/bash

# To be nice to others, avoid requesting more than 60 nodes.
# When the cluster is busy, you may want to decrease node count to get running since
# Spark job won't start until number of requested nodes are available.
NUMBER_OF_SPARK_NODES=2

# source data parameters
SERVICE_HOST=$1 #"10.40.3.162:8080"      # use IP address for tem-services until DNS issue is resolved
OWNER=$2 #"flyTEM"
PROJECT=$3 #"test"
STACK=$4 #"EXP_v12_SURF_montage_1245_1247"
FIRST_Z=$5 #""                        # z value of first layer to generate (leave empty "" if first layer in stack is desired)
LAST_Z=$6 #""                         # z value of last layer to generate (leave empty "" if last layer in stack is desired)

# SIFT parameters
FD_SIZE=$7 #"8" #"4"  # feature descriptor size                  # The SIFT-descriptor consists of n×n gradient histograms, each from a 4×4px block. 
                  # n is this value. Lowe (2004) uses n=4. We found larger descriptors with n=8 
                  # perform better for Transmission Electron Micrographs from serial sections
MIN_SIFT_SCALE=$8 #"0.55" #"0.75"
MAX_SIFT_SCALE=$9 #"1.0"
STEPS=${10} #"3"          # Keypoint candidates are extracted at all scales between maximum image size and minimum image size. 
                   # This Scale Space is represented in octaves    each covering a fixed number of discrete scale steps
                   # from σ0 to 2σ0. More steps result in more but eventually less stable keypoint candidates. 
                   # Tip: Keep 3 as suggested by Lowe (2004) and do not use more than 10. 

# output parameters
SCALE=${11} #"0.05"                         # scale of layer montage images
SIMILARITY_RANGE=${12} #"3"                # maximum number of adjacent layers for similarity comparisons

unset SKIP_SIMILARITY_MATRIX
SKIP_SIMILARITY_MATRIX=${13} #"y"           # to build similarity matrix, comment this line out

unset SKIP_ALIGNED_IMAGE_GENERATION
SKIP_ALIGNED_IMAGE_GENERATION=${14} #"y"    # to generate aligned montage images, comment this line out (warning: this is slow)

BASE_OUTPUT_DIR=${15} #"/nobackup/flyTEM/spark_montage"
RUN_DIR=${16}

echo $NUMBER_OF_SPARK_NODES
echo $SERVICE_HOST
echo $OWNER
echo $PROJECT
echo $STACK
echo $FIRST_Z
echo $LAST_Z
echo $FD_SIZE
echo $MIN_SIFT_SCALE
echo $MAX_SIFT_SCALE
echo $STEPS
echo $SCALE
echo $SIMILARITY_RANGE
echo $SKIP_SIMILARITY_MATRIX
echo $SKIP_ALIGNED_IMAGE_GENERATION
echo $BASE_OUTPUT_DIR
echo $RUN_DIR


