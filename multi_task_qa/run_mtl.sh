tfkit-train --maxlen 512 --savedir ./mt-qaner --train ./task_datasets/covidner/train.csv --test ./task_datasets/covidner/test.csv --model tag --config roberta-base --batch 2
tfkit-train --maxlen 512 --savedir ./mt-qaner --train ./task_datasets/squad1/train-v1.1.csv --test ./task_datasets/squad1/dev-v1.1.csv --model qa --config roberta-base --batch 2
tfkit-train --maxlen 512 --savedir ./mt-qaner --train ./task_datasets/squad1/dev-v1.1.csv --test ./task_datasets/squad1/dev-v1.1.csv --model qa --config roberta-base --batch 2
tfkit-train --maxlen 512 --savedir ./mt-qaner --train ./task_datasets/covidner/train.csv ./task_datasets/squad1/train-v1.1.csv --test ./task_datasets/covidner/test.csv ./task_datasets/squad1/dev-v1.1.csv --model tag qa --config roberta-base --batch 4