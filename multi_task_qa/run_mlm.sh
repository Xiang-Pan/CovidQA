python mlm/run_mlm.py \
    --model_name_or_path "./outputs/roberta-base/squad1/epoch=1.ckpt" \
    --train_file "./context_train.txt" \
    --validation_file "./context_dev.txt" \
    --do_train \
    --do_eval \
    --output_dir "./cached_models/roberta-covid"