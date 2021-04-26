#!/usr/bin/env bash
# -*- coding: utf-8 -*-

REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

TASK_NAME=squad1

OUTPUT_DIR_BASE=$REPO_PATH/outputs
#! BERT VERSION


BERT_TYPE=bert-base-uncased

OUTPUT_DIR=$OUTPUT_DIR_BASE/$BERT_TYPE/$TASK_NAME

echo $OUTPUT_DIR

# OUTPUT_DIR_BASE=$REPO_PATH/outputs
# OUTPUT_DIR=${OUTPUT_DIR_BASE}/$BERT_TYPE/$TASK_NAME/

# OUTPUT_DIR=$REPO_PATH/outputs/ce_loss/$TASK_NAME/reproduce_bert_base_ce

MODEL_CKPT=${OUTPUT_DIR}/"epoch=0.ckpt"
HPARAMS_PATH=${OUTPUT_DIR}/lightning_logs/version_0/hparams.yaml

# CUDA_VISIBLE_DEVICES=3 
python ${REPO_PATH}/tasks/squad/evaluate_models.py \
--gpus="0," \
--path_to_model_checkpoint ${MODEL_CKPT} \
--path_to_model_hparams_file ${HPARAMS_PATH}