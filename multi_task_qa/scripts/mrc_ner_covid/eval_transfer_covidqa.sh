#!/usr/bin/env bash
# -*- coding: utf-8 -*-

REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

MODEL_TASK_NAME=mrc_ner

MODEL_DIR=$REPO_PATH/outputs/bce/$MODEL_TASK_NAME/brain_enonto_dice_base_12_300_2e-5_linear_0.1_6_5_1.0_0.002_0.1_1_1_0.3_bce
echo $MODEL_DIR
MODEL_CKPT=${MODEL_DIR}/epoch=4.ckpt

TASK_NAME=squad1
# OUTPUT_DIR=$REPO_PATH/outputs/ce_loss/$TASK_NAME/reproduce_bert_base_ce
HPARAMS_PATH=${OUTPUT_DIR}/lightning_logs/version_0/hparams.yam
# HPARAMS_PATH=$REPO_PATH/outputs/bce/$MODEL_TASK_NAME/brain_enonto_dice_base_12_300_2e-5_linear_0.1_6_5_1.0_0.002_0.1_1_1_0.3_bce/lightning_logs/version_2  

#
# TEST_DIR = 
HPARAMS_PATH=${OUTPUT_DIR}/lightning_logs/version_0/hparams.yaml

# CUDA_VISIBLE_DEVICES=3 
python ${REPO_PATH}/tasks/squad/evaluate_models.py \
--gpus="0," \
--path_to_model_checkpoint ${MODEL_CKPT} \
--path_to_model_hparams_file ${HPARAMS_PATH}