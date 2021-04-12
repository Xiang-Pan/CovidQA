#!/usr/bin/env python3
# -*- coding: utf-8 -*-


# from pytorch_lightning.metrics.metric import TensorMetric
from torchmetrics import Metric
from metrics.functional.ner_span_f1 import bmes_decode_flat_query_span_f1

# MRCNERSpanF1
class MRCNERSpanF1(Metric):
    """
    Query Span F1
    Args:
        flat: is flat-ner
    """
    def __init__(self, reduce_group=None, reduce_op=None, flat=False):
        super(MRCNERSpanF1, self).__init__()
        # super(QuerySpanF1, self).__init__(name="query_span_f1",
        #                                   reduce_group=reduce_group,
        #                                   reduce_op=reduce_op)
        self.flat = flat
    def compute(self):
        return self
    def update(self):
        return self
    def forward(self, start_preds, end_preds, match_logits, start_end_label_mask, start_labels, end_labels, match_labels, answerable_pred=None):
        # print(answerable_pred)
        return bmes_decode_flat_query_span_f1(start_preds, end_preds, match_logits, start_end_label_mask, start_labels,end_labels, match_labels, answerable_pred=answerable_pred)

