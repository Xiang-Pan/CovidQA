#!/usr/bin/env bash
# -*- coding: utf-8 -*-

REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"


TASK_NAME=squad

OUTPUT_DIR=$REPO_PATH/outputs/ce_loss/$TASK_NAME/reproduce_bert_base_ce

MODEL_CKPT=${OUTPUT_DIR}/epoch=1.ckpt
HPARAMS_PATH=${OUTPUT_DIR}/lightning_logs/version_4/hparams.yaml

# CUDA_VISIBLE_DEVICES=3 
python ${REPO_PATH}/tasks/squad/evaluate_models.py \
--gpus="0," \
--path_to_model_checkpoint ${MODEL_CKPT} \
--path_to_model_hparams_file ${HPARAMS_PATH}