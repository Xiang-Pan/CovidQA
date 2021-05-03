python mlm/run_mlm.py \
    --model_name_or_path "roberta-base" \
    --train_file "./mlm/context_train_and_dev.txt" \
    --validation_file "./mlm/context_dev.txt" \
    --do_train \
    --do_eval \
    --use_fast_tokenizer False \
    --output_dir "./cached_models/roberta_covidmlm(train_and_dev)_3epoch" 