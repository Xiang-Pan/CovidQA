#!/usr/bin/env bash
# -*- coding: utf-8 -*-

# REPO_PATH=/data/xiaoya/workspace/mrc-with-dice-loss
# export PYTHONPATH="$PYTHONPATH:$REPO_PATH"
REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

# OUTPUT_DIR=/data/xiaoya/outputs/dice_loss/squad/gpu4_ce_base_2_1.0_1__adamw_3e-5_0.1_12_64_384_128

TASK_NAME=squad1

# OUTPUT_DIR=$REPO_PATH/outputs/ce_loss/$TASK_NAME/reproduce_bert_base_ce

# MODEL_CKPT=${OUTPUT_DIR}/epoch=1.ckpt


MODEL_CKPT=$REPO_PATH/cached_models/roberta_covidmlm_train_and_dev_3epoch_squad1_2epoch/roberta_covidmlm_train_and_dev_3epoch_squad1_2epoch.ckpt

HPARAMS_PATH=${REPO_PATH}/cached_models/roberta_covidmlm_train_and_dev_3epoch_squad1_2epoch/eval_covidqa_hparams.yaml

# CUDA_VISIBLE_DEVICES=3 
python ${REPO_PATH}/tasks/squad/evaluate_models.py \
--gpus="0," \
--path_to_model_checkpoint ${MODEL_CKPT} \
--path_to_model_hparams_file ${HPARAMS_PATH}