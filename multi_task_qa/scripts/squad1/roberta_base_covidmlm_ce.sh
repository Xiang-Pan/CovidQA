#!/usr/bin/env bash
# -*- coding: utf-8 -*-


# REPO_PATH=/userhome/xiaoya/mrc-with-dice-loss

REPO_PATH=$(pwd)
export PYTHONPATH="$PYTHONPATH:$REPO_PATH"


TASK_NAME=squad1
DATA_DIR=$REPO_PATH/task_datasets/$TASK_NAME

#! BERT VERSION
BERT_TYPE=roberta_covidmlm_train_and_dev_3epoch

BERT_DIR=$REPO_PATH/cached_models/$BERT_TYPE

LOSS_TYPE=ce
LR=3e-5
LR_SCHEDULE=linear
OPTIMIZER=adamw
WARMUP_PROPORTION=0.002

GRAD_CLIP=1.0
ACC_GRAD=1
MAX_EPOCH=2
BERT_DROPOUT=0.1
WEIGHT_DECAY=0.002

TRAIN_BATCH_SIZE=12
MAX_QUERY_LEN=64
MAX_SEQ_LEN=384
DOC_STRIDE=128

PRECISION=16
PROGRESS_BAR=1
VAL_CHECK_INTERVAL=0.125
DISTRIBUTE=ddp

OUTPUT_DIR_BASE=$REPO_PATH/outputs
OUTPUT_DIR=${OUTPUT_DIR_BASE}/$BERT_TYPE/$TASK_NAME

mkdir -p ${OUTPUT_DIR}
CACHE_DIR=${OUTPUT_DIR}/cache
mkdir -p ${CACHE_DIR}

python ${REPO_PATH}/tasks/squad/train.py \
--gpus="0," \
--precision=${PRECISION} \
--train_batch_size ${TRAIN_BATCH_SIZE} \
--progress_bar_refresh_rate ${PROGRESS_BAR} \
--val_check_interval ${VAL_CHECK_INTERVAL} \
--max_query_length ${MAX_QUERY_LEN} \
--max_seq_length ${MAX_SEQ_LEN} \
--doc_stride ${DOC_STRIDE} \
--optimizer ${OPTIMIZER} \
--loss_type ${LOSS_TYPE} \
--data_dir ${DATA_DIR} \
--bert_hidden_dropout ${BERT_DROPOUT} \
--bert_config_dir ${BERT_DIR} \
--lr ${LR} \
--lr_scheduler ${LR_SCHEDULE} \
--accumulate_grad_batches ${ACC_GRAD} \
--default_root_dir ${OUTPUT_DIR} \
--output_dir ${OUTPUT_DIR} \
--max_epochs ${MAX_EPOCH} \
--gradient_clip_val ${GRAD_CLIP} \
--weight_decay ${WEIGHT_DECAY} \
--do_lower_case \
--warmup_proportion ${WARMUP_PROPORTION}