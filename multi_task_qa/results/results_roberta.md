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

# COVIDQ_CLS
VAL F1 0.67801
<!-- 
- second run

DATALOADER:0 TEST RESULTS
{'exact_match': 24.752475247524753,
 'span_f1': 42.158526688709436,
 'val_loss': tensor(0.8771, device='cuda:0')} -->

# SQUAD1_MLM_COVIDQA
DATALOADER:0 TEST RESULTS
{'exact_match': 11.881188118811881,
 'span_f1': 24.52323014594557,
 'val_loss': tensor(5.7791, device='cuda:0')}

# SQUAD1_MLM_COVIDQA(train_dev)
DATALOADER:0 TEST RESULTS
{'exact_match': 11.633663366336634,
 'span_f1': 21.088512041983698,
 'val_loss': tensor(5.7427, device='cuda:0')}

# COVIDQA_COVIDQA
{'exact_match': 25.99009900990099,
 'span_f1': 50.196758879478054,
 'val_loss': tensor(0.1942, device='cuda:0')}

# COVIDQ_CLS(Covid Quesetion Text Classification)
f1 0.69735 (best 0.69735)

# SQUAD1_COVIDQCLS_COVIDQA
DATALOADER:0 TEST RESULTS
{'exact_match': 24.752475247524753,
 'span_f1': 42.158526688709436,
 'val_loss': tensor(0.8771, device='cuda:0')}

# Table
| Training    | Test |
| ----------- | ----------- |
| squad1 (span_f1:       90.41)   |   |
| CovidQA (span_f1:       50.19)   |    |
| squad1_mlm  | CovidQA(24.52)        |
| squad1_mlm  | CovidQA(24.52)        |
| squad1    | CovidQA(42.04)        |
| squad1 + covidqcls     | CovidQA(42.15)        |


# eval_roberta_covidmlm_train_and_dev_3epoch_squad1_2epoch.sh
DATALOADER:0 TEST RESULTS
{'exact_match': 26.980198019801982,
 'span_f1': 47.21909464454658,
 'val_loss': tensor(0.3078, device='cuda:0')}


# eval_roberta_covidqcls_2epoch_squad1_2epoch.sh
DATALOADER:0 TEST RESULTS
{'exact_match': 24.504950495049506,
 'span_f1': 42.63095745750584,
 'val_loss': tensor(0.3370, device='cuda:0')}
<!-- | squad1 + DAPT   | CovidQA(28.84)        |
|ace_2004(MRC_NER span_f1:0.6681)|CovidQA(2.27)|
|ace_2004_BERT + squad1_classifier|CovidQA(3.21)|
|ace_2004 + squad1(share BERT)| - | -->
<!-- | CovidQA(43.27)      |  CovidQA(43.27)    | -->

# ./scripts/squad1/eval_roberta_covidmlm_train_and_dev_3epoch_covidqcls_4epoch_squad1_2epoch.sh
{'exact_match': 28.217821782178216,
 'span_f1': 45.83140108364576,
 'val_loss': tensor(0.3080, device='cuda:0')}

# ./scripts/squad1/eval_roberta_covidmlm_train_and_dev_3epoch_covidqcls_4epoch_squad1_1epoch.sh
DATALOADER:0 TEST RESULTS
{'exact_match': 19.059405940594058,
 'span_f1': 32.95114123284045,
 'val_loss': tensor(3.7847, device='cuda:0')}

# resources
https://github.com/JerryWei03/COVID-Q