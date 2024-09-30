root_dir=./llama2
task_name=mix_driveqa_decision
MASTER_PORT=29542

deepspeed --include=localhost:$1 --master_port $MASTER_PORT  llama2/sft_llama2_trainer.py \
--model_name_or_path path/to/llama-2-13b-chat-hf \
--train_files path/to/mixed_decision_driveqa_train_epoch3.json \
--validation_files path/to/mixed_decision_driveqa_val.json \
--ckpt_path path/to/drive_qa/ckpts \
--per_device_train_batch_size 2 \
--per_device_eval_batch_size 1 \
--do_train \
--do_eval \
--use_fast_tokenizer False \
--output_dir ${root_dir}/output/${task_name} \
--evaluation_strategy steps \
--learning_rate 5e-5 \
--gradient_accumulation_steps 10 \
--freeze_map_adapter True \
--num_train_epochs 1 \
--warmup_steps 10 \
--load_in_bits 4 \
--lora_r 8 \
--lora_alpha 32 \
--target_modules q_proj,k_proj,v_proj,o_proj,down_proj,gate_proj,up_proj \
--logging_dir ${root_dir}/tensorboard/${task_name} \
--logging_steps 10 \
--logging_strategy steps \
--save_strategy steps \
--preprocessing_num_workers 10 \
--save_total_limit 1 \
--save_steps 10000 \
--eval_steps 10000 \
--seed 7 \
--disable_tqdm False \
--ddp_find_unused_parameters False \
--block_size 3072 \
--report_to tensorboard \
--overwrite_output_dir \
--resize_token_embeddings True \
--map_input_size 256 \
--deepspeed ${root_dir}/ds_config.json \
--bf16 \
--bf16_full_eval \
--ddp_timeout 18000000 \
--add_special_tokens "<map>,</map>" \
--gradient_checkpoint 
