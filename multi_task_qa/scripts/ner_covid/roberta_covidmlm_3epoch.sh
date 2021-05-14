# Copyright 2020 The HuggingFace Team. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

BERT_TYPE=roberta_covidmlm_train_and_dev_3epoch
BERT_DIR=./cached_models/$BERT_TYPE

TASK_NAME=covidner
# REPO_PATH=$(pwd)
# echo $REPO_PATH
DATA_DIR=task_datasets/covidner


python ./tasks/ner/run_ner.py \
  --model_name_or_path $BERT_DIR \
  --train_file $DATA_DIR/train.json \
  --validation_file $DATA_DIR/dev.json \
  --test_file   $DATA_DIR/test.json  \
  --output_dir ./outputs/$BERT_TYPE/$TASK_NAME \
  --do_train \
  --do_eval  \
  --do_predict
