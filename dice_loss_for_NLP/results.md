# Original Domain

# Squad1 only(best)
best exact match
80.6433

span_f1
88.1431

# ace 2004 only(best)
0.71338
{'test_span_f1': tensor(0.6681, device='cuda:0'),
 'test_span_precision': tensor(0.6829, device='cuda:0'),
 'test_span_recall': tensor(0.6540, device='cuda:0')}

# combine


# Covid Doamin
# QA only
43.27

# transfer
covidqa(43.27)
squad1  (span_f1:       88.1431)  -> covidqa(28.84)
ace_2004(MRC_NER span_f1:0.6681)  -> covidqa(2.27)
ace_2004_bert + squad1_classifier -> covidqa(3.21)

