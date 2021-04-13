#!/usr/bin/env bash
# -*- coding: utf-8 -*-

REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"

TASK_NAME=squad1

OUTPUT_DIR=$REPO_PATH/outputs/ce_loss/$TASK_NAME/reproduce_bert_base_ce

MODEL_CKPT=${OUTPUT_DIR}/epoch=0_v0.ckpt
HPARAMS_PATH=${OUTPUT_DIR}/lightning_logs/version_0/hparams_transfer.yaml
MODEL_CKPT="/home/xiangpan/Labs/CovidQA/dice_loss_for_NLP/outputs/bce/mrc_ner/brain_enonto_dice_base_12_300_2e-5_linear_0.1_6_5_1.0_0.002_0.1_1_1_0.3_bce/epoch=4.ckpt"
HPARAMS_PATH=${OUTPUT_DIR}/lightning_logs/version_0/hparams_transfer.yaml

# CUDA_VISIBLE_DEVICES=3 
python ${REPO_PATH}/tasks/squad/evaluate_models_from_ner.py \
--gpus="0," \
--path_to_model_checkpoint ${MODEL_CKPT} \
--path_to_model_hparams_file ${HPARAMS_PATH}