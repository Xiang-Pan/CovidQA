import os
import argparse
import logging
from typing import Dict
from collections import namedtuple

from numpy import number
from utils.random_seed import set_random_seed
set_random_seed(0)

import torch
from torch import Tensor
from torch.nn import functional as F
from torch.nn import CrossEntropyLoss
from torch.utils.data import DataLoader, RandomSampler, SequentialSampler

from transformers import AdamW, AutoTokenizer, BertTokenizer, get_linear_schedule_with_warmup, get_polynomial_decay_schedule_with_warmup
from transformers.data.datasets import SquadDataset

import pytorch_lightning as pl
from pytorch_lightning import Trainer
from pytorch_lightning.callbacks.model_checkpoint import ModelCheckpoint

from models.model_config import BertForQAConfig
from models.bert_qa import BertForQuestionAnswering
from loss import DiceLoss, FocalLoss
from utils.get_parser import get_parser
from task_datasets.squad_dataset import SquadDataset
from task_datasets.truncate_dataset import TruncateDataset
from metrics.squad_em_f1 import SquadEvalMetric

# from models.model_config import BertForQueryNERConfig
# from models.bert_query_ner import BertForQueryNER    



from tasks.squad.train import BertForQA
"""main"""
parser = get_parser()
# add model specific arguments.
parser = BertForQA.add_model_specific_args(parser)
# add all the available trainer options to argparse
parser = Trainer.add_argparse_args(parser)
args = parser.parse_args()

qa_model = BertForQA(args)

if len(args.pretrained_checkpoint) > 1:
    model.load_state_dict(torch.load(args.pretrained_checkpoint,map_location=torch.device('cpu'))["state_dict"])
# if args.load_ner_bert:
    # model.model.bert.load_state_dict(torch.load("./cached_models/ner_bert"),strict= False)

checkpoint_callback = ModelCheckpoint(
    filepath=args.output_dir,
    save_top_k=args.max_keep_ckpt,
    verbose=True,
    period=-1,
    mode="auto"
)

squad_trainer = Trainer.from_argparse_args(
    args,
    checkpoint_callback=checkpoint_callback,
    deterministic=True
)


# QCLS
from tasks.tnews import TNewsClassificationTask

parser = get_parser()
parser = TNewsClassificationTask.add_model_specific_args(parser)
parser = Trainer.add_argparse_args(parser)
args = parser.parse_args()

cls_model = TNewsClassificationTask(args, roberta_share = qa_model.roberta)

checkpoint_callback = ModelCheckpoint(
    filepath=args.output_dir,
    save_top_k=args.max_keep_ckpt,
    save_last=False,
    monitor="val_f1",
    verbose=True,
    mode='max',
    period=-1)

cls_trainer = Trainer.from_argparse_args(
    args,
    checkpoint_callback=checkpoint_callback,
    deterministic=True
)

for epoch in number_epochs:
    cls_trainer.fit(cls_model,max_step = 1,max_steps = 20)
    squad_trainer.fit(qa_model, max_epochs = 1,max_steps = 20)



# # after training, use the model checkpoint which achieves the best f1 score on dev set to compute the f1 on test set.
# best_f1_on_dev, path_to_best_checkpoint = find_best_checkpoint_on_dev(args.output_dir,only_keep_the_best_ckpt=args.only_keep_the_best_ckpt_after_training)
# task_model.result_logger.info("=&" * 20)
# task_model.result_logger.info(f"Best F1 on DEV is {best_f1_on_dev}")
# task_model.result_logger.info(f"Best checkpoint on DEV set is {path_to_best_checkpoint}")
# task_model.result_logger.info("=&" * 20)

