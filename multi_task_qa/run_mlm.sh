python mlm/run_mlm.py \
    --model_name_or_path "./cached_models/roberta_squad1_2epoch" \
    --train_file "./context_train.txt" \
    --validation_file "./context_dev.txt" \
    --do_train \
    --do_eval \
    --use_fast_tokenizer False \
    --output_dir "./cached_models/roberta-squad1-covidmlm" 