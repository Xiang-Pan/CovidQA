<!-- ---
title: my title
author: my name
date: today
--- -->

# BERT Base

## Squad1 only(best)

best exact match
80.6433

span_f1
88.1431

## ace 2004 only(best)
0.71338
{'test_span_f1': tensor(0.6681, device='cuda:0'),
 'test_span_precision': tensor(0.6829, device='cuda:0'),
 'test_span_recall': tensor(0.6540, device='cuda:0')}

## Combine


## Covid Doamin
### QA only
43.27

## transfer
sharBEed

| Training    | Test |
| ----------- | ----------- |
| CovidQA(43.27)      |  CovidQA(43.27)    |
| squad1  (span_f1:       88.1431)   | CovidQA(28.84)        |
|ace_2004(MRC_NER span_f1:0.6681)|CovidQA(2.27)|
|ace_2004_BERT + squad1_classifier|CovidQA(3.21)|
|ace_2004 + squad1(share BERT)|CovidQA(3.21)|

# TODO


# resources
https://github.com/JerryWei03/COVID-Q