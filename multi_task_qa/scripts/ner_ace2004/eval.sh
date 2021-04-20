#!/usr/bin/env bash
# -*- coding: utf-8 -*-


PRECISION=32
# FILE_NAME=eval_mrc_ner
# REPO_PATH=/data/xiaoya/workspace/mrc-with-dice-loss


# export PYTHONPATH="$PYTHONPATH:$REPO_PATH"
REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

CKPT_PATH=${REPO_PATH}/outputs/bce/mrc_ner/brain_enonto_dice_base_12_300_2e-5_linear_0.1_6_5_1.0_0.002_0.1_1_1_0.3_bce/epoch=4.ckpt

python3 ${REPO_PATH}/tasks/mrc_ner/evaluate.py \
--gpus="0" \
--precision=${PRECISION} \
--path_to_model_checkpoint ${CKPT_PATH}


# CUDA_VISIBLE_DEVICES=0 python3 ${REPO_PATH}/tasks/mrc_ner/evaluate.py \
# --gpus="1" \
# --path_to_model_checkpoint $OUTPUT_DIR/epoch=2.ckpt