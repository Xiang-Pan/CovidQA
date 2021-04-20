#!/usr/bin/env bash
# -*- coding: utf-8 -*-


PRECISION=32
FILE_NAME=eval_mrc_ner
REPO_PATH=/data/xiaoya/workspace/mrc-with-dice-loss
CKPT_PATH=$1

# export PYTHONPATH="$PYTHONPATH:$REPO_PATH"
REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

# CUDA_VISIBLE_DEVICES=0

python3 ${REPO_PATH}/tasks/mrc_ner/evaluate.py \
--gpus="0" \
--precision=${PRECISION} \
--path_to_model_checkpoint ${CKPT_PATH}


# CUDA_VISIBLE_DEVICES=0 python3 ${REPO_PATH}/tasks/mrc_ner/evaluate.py \
# --gpus="1" \
# --path_to_model_checkpoint $OUTPUT_DIR/epoch=2.ckpt