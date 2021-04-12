#!/usr/bin/env bash
# -*- coding: utf-8 -*-


# REPO_PATH=/userhome/xiaoya/mrc-with-dice-loss
# export PYTHONPATH="$PYTHONPATH:$REPO_PATH"
REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

DATA_DIR=$REPO_PATH/datasets/squad1
BERT_DIR=$REPO_PATH/cached_models/bert-base-uncase

# DATA_DIR=$1

DATA_FILE=${DATA_DIR}/dev-v1.1.json
OUTPUT_DIR=$REPO_PATH/outputs/dice_loss/squad/reproduce_bert_base_ce


python3 ${REPO_PATH}/tasks/squad/evaluate_predictions.py ${DATA_FILE} ${OUTPUT_DIR}

