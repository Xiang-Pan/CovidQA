<!-- ---
title: my title
author: my name
date: today
--- -->

# SQUAD1_SQUAD1
{'exact_match': 83.33017975402082,
 'span_f1': 90.4102244642859,
 'val_loss': tensor(12.7738, device='cuda:0')}

# SQUAD1_COVIDQA
DATALOADER:0 TEST RESULTS
{'exact_match': 24.752475247524753,
 'span_f1': 42.048515687609324,
 'val_loss': tensor(0.8771, device='cuda:0')}

# Table
| Training    | Test |
| ----------- | ----------- |
| squad1  (span_f1:       90.41)   | squad1(42.04)        |
| squad1  (span_f1:       90.41)   | CovidQA(42.04)        |
<!-- | squad1 + DAPT   | CovidQA(28.84)        |
|ace_2004(MRC_NER span_f1:0.6681)|CovidQA(2.27)|
|ace_2004_BERT + squad1_classifier|CovidQA(3.21)|
|ace_2004 + squad1(share BERT)| - | -->
<!-- | CovidQA(43.27)      |  CovidQA(43.27)    | -->

# resources
https://github.com/JerryWei03/COVID-Q